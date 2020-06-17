Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD31FC9F6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 11:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4AC6E356;
	Wed, 17 Jun 2020 09:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99036E356
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 09:36:49 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j198so4061599wmj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 02:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kqV7b/dRGRsaYFJFTZmEAIxbxpemJlUlmyVmWunucJQ=;
 b=a1jJ0h4Gh9g26ELV/twHuTjWpRiKFHPp8TLQgzONwinJq+v0ldA8u5Eup6Ntp0eQBq
 nc1Lpg4kzTSI9EogHgUCu6Yr5o6TiGOdyYEUUCMjtBhKeBJkCdSzbL0uqikcMECQzOVp
 Zqchdh7yOtiUOSFYENISzhvCiIXwq0wbd6SI3ndto2+BES4dRC4hLCUprwa87V2AsrtG
 WqhBE2JM8omhJa4pmFycbSidghsV633Z49FM1+QGKfYNjHFDCxSOmXRnl7+h05r/tn6p
 /DmqFKKV9v2dwcM9yR1IGCSbxzmt71MWIxNdkkqw6pfqLArKDMB6tJBJm/imJNvsP/oA
 imzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kqV7b/dRGRsaYFJFTZmEAIxbxpemJlUlmyVmWunucJQ=;
 b=D7SyWDH90CLOA0L9ecC0kyrmcNZFU+GKWqc8FPpmUWjhrVQTKCF2CTrBdIvAK2S1oD
 WR35e6ETdyK5xS7KoH0+I1NnMF44ZjS8nHb/S9OaJp9WYjsT6PaBsnM1iTq0q9jlfDlI
 N00FytMwLquHjDMUdZCPSG6dR6Ow1mGYADf+057p22o3eURCX2faEEvWwGFuv/WcQ0KA
 bypLogTs20Cv8O+zlti/AW41bRcqlphQv+4Nt6DCwVw/1nq6ulCFLV3GdwKSmICWNUUD
 ILoOwrWT3DA7BCGsNEs8IP7p/3lqZBraPB4dpZDdd4W1uND2F5m647Ainm03eWYUtajy
 j+DQ==
X-Gm-Message-State: AOAM530oItP37nAMQcF3gsNSmWsehYJTUWF1BuBFNmnWa8avDPAXka/j
 mqUw6Wga/xg9Dmh05W7ZC1VVLw65Q/NNTo4XWHDPBg==
X-Google-Smtp-Source: ABdhPJyt/DSGWPMjUA/TqeAozgDqsIajAJ3rBCfT6Uxx5ItAbPuwx37kc6zO5bdEkyBLeZ+LenZ5E1u117tWg7+oIi0=
X-Received: by 2002:a1c:bbd6:: with SMTP id l205mr7896275wmf.147.1592386608011; 
 Wed, 17 Jun 2020 02:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200614200121.14147-1-digetx@gmail.com>
 <CACvgo51QuXMgWhFk4C=3rGvUZDX1_W0RZtVb5RtRPiHTpMebWQ@mail.gmail.com>
 <8f789ef5-bebf-c869-784d-afda70fc1fb8@gmail.com>
 <CACvgo50oSMbgXw1vHwVT4hhGe6g3YzKQEohCLJdfDq+0UaN1jw@mail.gmail.com>
 <646b3f37-0f72-7f3b-388f-f71dbcdd5c84@gmail.com>
 <CACvgo50BFH5qsPyWx9a1aZ4k5bzjSN-3KTU0BvnZ-nG-hfzKOQ@mail.gmail.com>
 <fe845434-cbf6-29d4-eeb6-8868d628fd04@gmail.com>
In-Reply-To: <fe845434-cbf6-29d4-eeb6-8868d628fd04@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 17 Jun 2020 10:34:41 +0100
Message-ID: <CAPj87rPwwHWtYpuZfiTMyELvr3D+UAY8CVnH3v6+Lo1-UMRRVA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] 180 degrees rotation support for NVIDIA Tegra DRM
To: Dmitry Osipenko <digetx@gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, Derek Basehore <dbasehore@chromium.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 16 Jun 2020 at 22:16, Dmitry Osipenko <digetx@gmail.com> wrote:
> The panel's orientation could be parsed by any panel driver and then
> assigned as the connector's property in order to allow userspace/FB-core
> to decide what to do with the rotated display. Apparently upstream
> kernel supports only that one Samsung device which has display panel
> mounted upside-down and it already uses the custom DT properties for
> achieving the 180 rotation. So I don't quite see any panel drivers that
> instantly could benefit from using the rotation property. Perhaps I can
> add the orientation support to the panel-simple driver, but will it be
> useful to anyone?

Yes, exposing it to userspace is helpful, since Weston at least will
parse the property and then apply the correct transform:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/315

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
