Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 394C82FEAB2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 13:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFA86E4E8;
	Thu, 21 Jan 2021 12:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731B56E0BC;
 Thu, 21 Jan 2021 12:53:44 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m22so2344650lfg.5;
 Thu, 21 Jan 2021 04:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MmTm0kcIS2XlFiuN2VlciFi+IEpGEQKQ3Sb827mikqo=;
 b=IRVPk/Nf+OcpDDLgbNg1iBZMoz4SApe7uVU/dbFk8BrO0Wsu7dIiWW9CjBIA5HVa0H
 471b3i1HjBfImHrP8cftYGYipLCHkXAc9M26B0vxNpZRyo2vCv5aPbNcimuADr317e0K
 B0LJRsizHhYIFOAcF5vP+A8qDH9knHX65tFG1Tb/9cOyQfn32qdrSBc5gWBHg9OuqdVY
 HEYJ2TsEXtovL2ye7Le9T5D/SmmYrE81gwVlN0Xp7VfRCMyBVXeq5pxszPXaRxYqmIpt
 IjwQQoD3qf/Br2g9jkksx07RWGce9yLCKHs2RTOPcY1stsMWOxrPN+t/UFeuueJXOg5m
 Dbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MmTm0kcIS2XlFiuN2VlciFi+IEpGEQKQ3Sb827mikqo=;
 b=SAj6xgeSP/9I8W0fmroiLZ7RwOYZoGKlOH34qtz4Wxgq9czfSbH9nwV72UO6Np56s6
 CdwTxOnjkDNexGglHxDJLYDSoEucmAe/1D4ywcPGfWDFDY0dskTFBqK/4UxgyZfFf85/
 5MgfKlyfARXkOd/D+5Jb5+tDkRsbatKVXjYRxlaymP4xwbFqr7HjsinyeN8iv/YnlMCs
 XZZI/GzRLd7yO7zd4ANe3D3heYGCzkzQOwK8wEBn7wLoNX/TI35SQvGKToQ1d6g5Rl4u
 8obLBodGyihIuLFWFk//1X6LoQQLNzxBibNWmsk2WJZZsH1yZ7cH+/jr00XXOQW5veIA
 9ZOw==
X-Gm-Message-State: AOAM532Ci9k9Lz8wPa7G5WTxhph8U1m5t9Dfc/Vsk4NJipGUoAH3Hy6F
 x1Q3y7YGIGrUeFnjNkR40s2ax8p4pJPIe0XNW2M=
X-Google-Smtp-Source: ABdhPJxAfj7J80PqMcsHykN0cIoVDxp7XLLWzxqUE1Nb2InhO9Tr7awTFlgxhAloeLEbUHkD0SNUY3k0gbA5iGW8vwg=
X-Received: by 2002:a19:488c:: with SMTP id v134mr5430244lfa.229.1611233622876; 
 Thu, 21 Jan 2021 04:53:42 -0800 (PST)
MIME-Version: 1.0
References: <20210120110708.32131-1-jani.nikula@intel.com>
 <92f48ffdfa30c3941e0fd22337217f0b10d75ec8.camel@redhat.com>
 <875z3qmt5b.fsf@intel.com>
 <CAOMZO5Du9+DTYpuG3FNLRrO_LJVSJa3cdJWWwt_qzQDthGESkg@mail.gmail.com>
 <8735yums94.fsf@intel.com>
 <CAOMZO5DBXerrJEvvXnfzjB376SMKVJTyo9MRD0H0u9pz8p+2yg@mail.gmail.com>
 <87pn1ylcdd.fsf@intel.com>
In-Reply-To: <87pn1ylcdd.fsf@intel.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 21 Jan 2021 09:53:30 -0300
Message-ID: <CAOMZO5D5c=5uMD5HEfHk6z4C41zzOroRV7ghumjBgmWrLEuehg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix build after dp quirk helper change
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 9:10 AM Jani Nikula <jani.nikula@intel.com> wrote:

> Kinda catch-22 because next has dropped current drm-intel-next because
> it doesn't build because of the issue this patch fixes. ;)

Ok, so I built drm-intel-next and I was able to reproduce the buid
error as reported by Stephen.

Applied this patch and it builds fine now.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
