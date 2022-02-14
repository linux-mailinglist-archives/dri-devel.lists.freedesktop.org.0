Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EE94B4D90
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 12:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6B410E4CE;
	Mon, 14 Feb 2022 11:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FCC10E4CE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 11:15:08 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id f19so3905788qvb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 03:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kNpwt4nVTLPkFofbTnS/jg1wix52n78yKlK1BNxGl+E=;
 b=akPIVhIWi//FW+KHoZmYokVubjJAMx6z4tBsasbOiDXNcZA+9cV5WhAuqWi6qTFJq3
 NWRTVLZAnafJyFA4vbQArgGOmov15qG0Nst84/hkdGO++9fMIDQulWT71CgEf0UY3JJF
 vPi5v97MDp0LdqfYVfADLzPlA/joz8nZaE0N5NYyeFYocI8Ew8k9ZH6iuqJ9dwAZwJDn
 44OeW/ufrAWB64s6RFmrhNbavAQbQ2rVEaAs3n8RlVbsqdrCHIKaAlc8ObuGEmo+THYS
 oINtZBU8sv8s/hzCu8rg+AYJ8KJKheD0pMexdDLAaWb3+WKg+poM4DZBic93Fy1xuGXN
 33Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kNpwt4nVTLPkFofbTnS/jg1wix52n78yKlK1BNxGl+E=;
 b=BgY91grA25LjANXuCMlXvhq0v3OPYFHEsiKqy9Xa6AsKp4UAkR9tEsS7UbJDJMeqQ9
 gIr45X+4zbIh41GD2SSK6+GrFwfCrbZKs4ouCjr2KOACBsaGiEhF2d33FC1R/LRcSmKr
 Ri2jjXIft+u2peTQBWCjnrQMrJm54iN8SRmwttOGn3oTnRAQ4dDegjsdCMXg2TjSF3So
 HOr/9VOAHCOrbQjmHYcihTCvyyOUZogztXPYfcKfydv3Q/fEzFWYRP473a3wh8USD5dV
 1hraE4NDQXgB68o3/Me9lHmmMbUNqLjmVk9fChHeQPrqAW1eR2xwIilKbh6LOHgPeSzb
 XK4g==
X-Gm-Message-State: AOAM532eSRnDfKeSkEviob931fN19x0K0ov/09rbpuWezsnwg5h8N9Dt
 mo0GpuixJI6GziqYdQsbVhF27LPMOpwpDz4zgFVNMgjSAuQ=
X-Google-Smtp-Source: ABdhPJxZI5mO84+wiwMAUhQ9q1kEVo6ZMn254cIViNe2Qs73i9nTeLTwVGxMNeOyuNnVf22hpo7fYW+WWGMcUcX8xhQ=
X-Received: by 2002:ad4:5cef:: with SMTP id iv15mr8651254qvb.54.1644837307271; 
 Mon, 14 Feb 2022 03:15:07 -0800 (PST)
MIME-Version: 1.0
References: <20220214093439.2989-1-christian.koenig@amd.com>
 <20220214093439.2989-7-christian.koenig@amd.com>
In-Reply-To: <20220214093439.2989-7-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 14 Feb 2022 11:14:40 +0000
Message-ID: <CAM0jSHPrAeDTyq=ieTKFE-95a5tuFxhkxk5hXmL9z6D3p26sPw@mail.gmail.com>
Subject: Re: [PATCH 07/11] drm/amdgpu: remove PL_PREEMPT accounting
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 felix.kuehling@amd.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Feb 2022 at 09:34, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> This is provided by TTM now.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
