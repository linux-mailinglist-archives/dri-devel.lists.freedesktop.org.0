Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7D53087EB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 11:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3DD6EACB;
	Fri, 29 Jan 2021 10:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086C66EACB
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 10:46:35 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id s18so9905936ljg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 02:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EcPkquTY4BileezGaxaGl57VmC/Fee8xgPAwv2049xE=;
 b=UqhmAf2ki3o5vUCNX8/AbG2tqiiCc17+LMjwV2JLOo3mtNDHLmGaY8o9luutVASPJ8
 ctlDUSr13B8zzDwe4/1EA96tjwaXYGOyKzEW8cuNZcu5cLViBq6/ujnz+wR60lXbvdtS
 p0gq0CXKj/Qpes8+kWsjxk0ecKch9D3o3Mzc/i+Q/qlNuOFq3mUmynQIEx1O3DJ9WNpP
 lMjOX+4RcRMJYwioECYQaF3DPeQPIx/JHopABpnnGscGDn9abRCNwMp0fPSvHEZQKmR1
 a4Kp9ItfgmlP/3hgxxb/6xSUoucLmhuJpD/dUbBo3IawgHI4lJPtjcjxlCvPWOYIn3+J
 3RJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EcPkquTY4BileezGaxaGl57VmC/Fee8xgPAwv2049xE=;
 b=T8lCirgsDJuZ0D1q9008FCRQOTDXX4P70awCABcE+p2MdVtWUNCYqTZCnIkJPG3T7u
 Li0WqTDMqrIiRJGYgFz9/lFTQ5+5b0VVcpKPMne9IO/0sOE9QdTPiR+ZcXtvfs7N8pfp
 XvYSpSXfXKFVf492fT655lvzlR9lCw5zIOBK4R0sG1ufeoacWOmhOFIjvloJMl0Qy5WG
 WSi7MtNHDpK8WT4BfDOJw8yrFfsGYSBbAq1YbRBwjeowGgMN+tvkTFJnr+cyElJ2q+0s
 Mzmj9ciLyYgDLVb8mw4KHf6b8WGJZXGlXr8yYFyhcOysZUAifpyJC3KvjJMfsd28F7yt
 /xLA==
X-Gm-Message-State: AOAM530RwKNMlQGBlqQzUgY+j5C33vumuPcO/W5p1Rz8MViTBP88JWkC
 qmMb6U/7c6K7n3uQvWrWm9wW5v9YxtdhJM247wtSjyRd
X-Google-Smtp-Source: ABdhPJy2BPvD91iMMi6265qHp1wBD/9pyvV+1vOeiQhaCGyFZbgKvUTLqdn3dZ3H9GBo4HVawmQe5iEZowNIWcpGoPg=
X-Received: by 2002:a2e:9004:: with SMTP id h4mr2204689ljg.276.1611917193434; 
 Fri, 29 Jan 2021 02:46:33 -0800 (PST)
MIME-Version: 1.0
References: <20210129095604.32423-1-tzimmermann@suse.de>
In-Reply-To: <20210129095604.32423-1-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 29 Jan 2021 11:46:22 +0100
Message-ID: <CAMeQTsamDLbHq7NEcc2fBGXyiS0fu7E3O3RczBBH8etYHLASKw@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/gma500: Remove Moorestown/Medfield
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 10:56 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Support for Moorestown and Medfield platforms is being removed from
> the kernel. So here's a patch to remove the related code from the
> gma500 driver. On top of that I also cleaned up the configuration
> a bit.
>
> Note that Poulsbo and Cedartrail is still there and will remain. With
> the MID platforms gone, there's actually a chance of cleaning up the
> code for the desktop chips.
>
> I smoke tested the patchset by running Xorg and Weston on a Cedartrail
> system.

Hi Thomas,
It is correct that Moorestown platform support is removed in the
kernel but Oaktrail and Moorestown aren't interchangeable. They share
the same CPU/GPU but not platform. I still have an Oaktrail device
(Minnowboard v1) which needs to be supported. Medfield on the other
hand can go as far as I'm concerned.

I'll have a closer look at the patches this afternoon.

Thanks
Patrik
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
