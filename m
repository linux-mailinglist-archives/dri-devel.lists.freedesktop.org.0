Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 794B07FAC3A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805C110E3C5;
	Mon, 27 Nov 2023 21:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C1710E3C5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 21:06:45 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6d7fc4661faso2639673a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701119204; x=1701724004; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6MvgspvGOJ5Oc7JlDP/jNe1KFePpApC78H5IBZuXx4=;
 b=jT7eofOFNnYPywiz+XFFWO9tgXARhgvgwSY1bYC7vbJuwZdkpZh5pry8vuL+GwMLQc
 Wg/ix1U2x2CWA3bG9VxsvJx/BewacCQWYTApuWiTALdMF19U8lWrNwyFj2qLPeXZ4QqC
 Zx7eL0/jIC9vc33kimJEX8C+g2Lxj1VGAaRKJg7RoQMSrvby0kXJhxAWUv0yU0rz743+
 L334eSCBkd2rKRWp39YDMCDJwnmcMmft9WYjCNNkavrkuFgZgDAuDRGuuog0E3q0039+
 4Si2h0MANz7X9Z1/yckO7XvD3bFSB5Ptpou90d32WGBl8oqzv+AiTIiQkkzsAqo/MLyA
 an4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701119204; x=1701724004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6MvgspvGOJ5Oc7JlDP/jNe1KFePpApC78H5IBZuXx4=;
 b=Fr7B+DXfVq9TPwggmyO5poMwugss5mqe3cg/M8nN825JC2CToVm6IQD+pStQVikNQV
 7B4NG8yV9JbZaZqmiv3jDDWBnI7JnwfF1eWyMSJTkRGiaWC7AJm0VhiKmwiO7enczxwo
 8Sjs/7zvhSC0dJQcHFuvHHpslYtszuy7qOglMlUG2wVclhFc/RrpULKCDUTnjEt3/HPI
 h0D9gzF9nOM+RlfsWdn5Upfxt7/bMRK4hHM3RUWIvw8PRFgPlo8PHiM5aQ7Z0xHa7kM9
 N06tBNC0OYiYAEtysKUOrKAAc/F6LXg1Y0O0I1fDLTL+qCILJlQCdHjPe+FJpq10VHcM
 0GwQ==
X-Gm-Message-State: AOJu0Yzbtwd8rjOaQWxh+DGEMV+4agwZthmjAHhMwT2WX+nmakv2DgPs
 1+nSAUMzpKVOcNuc8HfXMk/mZSS60FKFaYZtKU8=
X-Google-Smtp-Source: AGHT+IGexxQ59Fwj1QUn7mRfUXHEU2XAq8lHyAA/j1mrFhWuykLhTFaXP3XoAj6MQSLZSkyejUzTaHHTKB2rt7TSfkI=
X-Received: by 2002:a05:6870:75c9:b0:1f9:9003:4164 with SMTP id
 de9-20020a05687075c900b001f990034164mr17853738oab.35.1701119204171; Mon, 27
 Nov 2023 13:06:44 -0800 (PST)
MIME-Version: 1.0
References: <20231122122449.11588-1-tzimmermann@suse.de>
 <20231122122449.11588-13-tzimmermann@suse.de>
In-Reply-To: <20231122122449.11588-13-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Nov 2023 16:06:33 -0500
Message-ID: <CADnq5_PuxKfwNz2C5way5D2A_VQ6dZgg8Z396VQ=i1daqJLLnA@mail.gmail.com>
Subject: Re: [PATCH 12/14] drm: Remove source code for non-KMS drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, cai.huoqing@linux.dev, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 7:25=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Remove all remaining source code for non-KMS drivers. These drivers
> have been removed in v6.3 and won't comeback.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Alex Deucher <alexander.deucher@amd.com>
