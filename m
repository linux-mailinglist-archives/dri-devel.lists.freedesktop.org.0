Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BDF3A4640
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 18:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82446E0B8;
	Fri, 11 Jun 2021 16:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C3F6E0B8;
 Fri, 11 Jun 2021 16:14:58 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id w4so9366300qvr.11;
 Fri, 11 Jun 2021 09:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PJx9k8K0Vlxp7Gyldm0RoVO0/91+usykGtV/bvwPqPg=;
 b=eIe0JVDHjZEOg9+/IVxKEAGM8g0u/yfIvf74IbE5DjSK0bs2l9GXKd0fS/PYCngo4v
 t9arp25R6EMqvO0SMf4LwAo+bG+f8luyOAicWGyYWWGY6MJAAqd5IRevTt52IrSmCN7h
 soA2BOYhmdS4Mbp4Qb2tQCRuPRi0Y/dv3J3ljKVEyZ0gKfb+KPxGbHZ9xBscWoReqnYg
 SHuxTVnIXYW6gmvx5E3+LV+b9lbFHjXYrJNjC+Lp9BBIIWCwDYhFjwnGvKMIvSD0vXu9
 LKCItNVxTobN9dgKc/AVoclJVvzxeYPNI4FTpHmkpw11XTe+l7kwI1/GHa8/irLzkNkQ
 HQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PJx9k8K0Vlxp7Gyldm0RoVO0/91+usykGtV/bvwPqPg=;
 b=TLVnH67RSLIkW0EtlsTzvYSVrjhKcpRRETJnMhx5G5zVVFOhfKIlCckPf7lY/6tHrH
 8+1E4hAX4qwKAS6CINE6gr/ieCNYKPXiAeYIFw9tSpZ1E8PaHetGhK4+vvgC1QyjkPG0
 QgqYMfg2kwXzlSZ9jvK/Pcds2aSZ4hgvguWfjhklkKYvRckxn4ce4Rnu5U/j/p2MJ79N
 xzhJsj57eZJsalfsy4wKaUow+LoHf46oFMVKSFuvQDzRQdtIpcXYB4VElByYeIeDv3kg
 CdIYvUG02t+bL+t1OoNqShyX+4E2NCfT0FkAmdBeM+1EDO9okcO2J8KNVVw1ZlGQP6ZY
 e9pw==
X-Gm-Message-State: AOAM5324htMgLEKQqmqjWE0IArUm+vMslbz3VucSFhAP+EUxaQPjJz6q
 wljjroaHK7VM2tFYwXQSZLJtoomjqNj/xfP/LBPbJyf1u6w=
X-Google-Smtp-Source: ABdhPJwMhe2uu3P/tEaBbxTQf0BzCJISlGtIES7/YTvWvDBOi9mpHrrpasDJnrp56yZo44DzM0wFE/1qPT7WToFefU0=
X-Received: by 2002:a05:6214:b6c:: with SMTP id
 ey12mr5598518qvb.48.1623428097252; 
 Fri, 11 Jun 2021 09:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210611145459.8576-1-thomas.hellstrom@linux.intel.com>
 <20210611145459.8576-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210611145459.8576-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 11 Jun 2021 17:14:30 +0100
Message-ID: <CAM0jSHMdhjpnPu7yHWuVS4Ym4OUnV4Qg1z5oWDiyuqBtx0eFKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/i915: Update object placement flags to be
 mutable
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Jun 2021 at 15:55, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> The object ops i915_GEM_OBJECT_HAS_IOMEM and the object
> I915_BO_ALLOC_STRUCT_PAGE flags are considered immutable by
> much of our code. Introduce a new mem_flags member to hold these
> and make sure checks for these flags being set are either done
> under the object lock or with pages properly pinned. The flags
> will change during migration under the object lock.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
