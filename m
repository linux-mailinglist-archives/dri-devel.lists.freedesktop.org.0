Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA33A613BE5
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 18:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A56310E043;
	Mon, 31 Oct 2022 17:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467D410E043
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 17:08:41 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-13b23e29e36so14117056fac.8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 10:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C7QyndEJfzTQZtJYUGQNW9nMNPikJDsHRWnpG2pdH0A=;
 b=K6/WUZRjViIDQIAfkzMVEOUsDuPwr0JFtCcs7Ug3FFb9N7TNoka4TcO8no3Lo2ohtf
 XZrQnY3BvV+uUuxjPiOAigJTIn/6lj66lAodSA0TiLC2uYfkA1sC15HQa63t2xOI+62z
 CsMHqDobXYIGzAVqZ/BYOznKbkBGtEqSXPZvzFCYYnaY8d9iEwYv2SRVyUrljvKK/Dlj
 iWfOWpbvTGrQ2fTvqfL1AouIv0qPNtjkNz1lKYn2G1dqeSJVa0inw6UJxu6rHMgukY0B
 azFdAhGzRJ43KS2j6EYeCEhWLdbvNfJnFPpjgPOF7k1dmxzAx0cnzVvXEs6vcBFfXHtN
 FE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C7QyndEJfzTQZtJYUGQNW9nMNPikJDsHRWnpG2pdH0A=;
 b=HUtbiVeggOHGyqnRf916/BYWr44ITkO8Ng2ztYWQEme0gH9g5L3MXCVOoRQkCew7zo
 a5GN6bpTO5rdSHFDCJ3WkV2NUku++Rale1bjmaugyiSupA0m9vI+yokUEbhZmhVnzuw8
 1ECnwL9DLGZuPQEphZDrkxVXfrgLVPZvmX5pahnxtcq35eyRLxFLtISdBDZ39UHXleM9
 dtbZ9V2B6LisjHTMY8s4ebl/nxaD0/QMrZxks35VUCU3PQcc7RVPthIo6knV/JGfWpzc
 y2wfqfCc0rGAvPNK515EitQnE9a4oUEBjmqCLB2HVE5LmlWCTUg6UI9+lWIcDUz8NnI/
 3NhA==
X-Gm-Message-State: ACrzQf3qOVgZLjcHS7ZBk4l8OcBU8+kVuSrx3dlWnLEmB2svpP9D39Ht
 OWFRhkz04g5iFBr6T7mtBe0FDmdGmr+XphfsXnE=
X-Google-Smtp-Source: AMsMyM5IY5vpz+/q6V8WNAJQ6H0ALrDJzjTwaVsyeomBJ9o8rzHrta9TQuJyRBS0P6+4ovIzDWQrwXwPeNTG6lrOfOs=
X-Received: by 2002:a05:6870:a116:b0:13a:f9de:6fd0 with SMTP id
 m22-20020a056870a11600b0013af9de6fd0mr17947325oae.46.1667236120523; Mon, 31
 Oct 2022 10:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221031165834.GA10150@duo.ucw.cz>
In-Reply-To: <20221031165834.GA10150@duo.ucw.cz>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 31 Oct 2022 13:08:28 -0400
Message-ID: <CADnq5_O0BotfaaMGz1oPiQno=g10DBygB2F6gfOuWd13M0C2LA@mail.gmail.com>
Subject: Re: 6.1-rc: names of video outputs changed?
To: Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 kernel list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Did you change which xorg DDX you are using?  E.g., between
xf86-video-modesetting and a xf86-video-[i915/radeon/amdgpu/etc.]?
They may have different naming conventions.

Alex

On Mon, Oct 31, 2022 at 1:04 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> I used to be able to do:
>
> pavel@duo:~$     xrandr --output HDMI1 --mode 1920x1080 --primary
> warning: output HDMI1 not found; ignoring
> pavel@duo:~$     xrandr --output VGA1 --mode 1280x1024 --below HDMI1
> warning: output VGA1 not found; ignoring
>
> ...but now I have to do:
>
> pavel@duo:~$     xrandr --output VGA-1 --mode 1280x1024 --below HDMI-1
> xrandr: cannot find crtc for output VGA-1
> pavel@duo:~$     xrandr --output LVDS-1 --off
> pavel@duo:~$     xrandr --output VGA-1 --mode 1280x1024 --below HDMI-1
>
> Notice the change from HDMI1 to HDMI-1. I believe that's new in 6.1 or
> so. Who did it and why? Hardware is thinkpad x220, and this breaks my
> scripts :-(.
>
> Best regards,
>                                                                 Pavel
> --
> People of Russia, stop Putin before his war on Ukraine escalates.
