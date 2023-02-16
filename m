Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAD2699733
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 15:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5736710E32E;
	Thu, 16 Feb 2023 14:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7DB10E32E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:22:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EAAE7CE2BC5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67871C433A1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676557336;
 bh=XyErJiTc6c0JLEDtDpSafRCw+3V5/yBkRFY2UEk2UyY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S/ufHpvfUgqq4zZ+yvVkuNLAGLvdtHg0LXWw6qZWmjkxqDid+kdsSLVUpA5+EPpU8
 cFD4QSOjT51TqSPDUrf8P8i2T+sx1r7kcWlM2h2Cu9jX6yexSW4a6iBF0TYYC67+Fi
 NYGACYIhCwCND6cDag1qmUD1jbxwqqtD0cq91oLB1q7xwg3+UjWFdgBn3cj5wOK5oL
 PAwvUPvbXX2M1LPbYCUs/XSnMZ4Ug8EN61QilZoPkFoPgqhqFMExWzkuWe/wf4h13V
 zeSoVVpGwAtltdzfJL1fseDVVPSXiQUUf7PF++LbiJSQkCFELyHz6Rn2WJG4lKcM14
 9KFwYgUfafWYw==
Received: by mail-yb1-f169.google.com with SMTP id a63so1143212ybg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 06:22:16 -0800 (PST)
X-Gm-Message-State: AO0yUKUQ/1IbAqDvQAvdMXMR8ztsoBSXSK3o7ksh3OP1GBRLbldpdzua
 h3WOiMkZx854RwpU7jVsjb9kh6q456h0yiFpDp0=
X-Google-Smtp-Source: AK7set/nf/Bmq4CvnAch42GAt7r428TaTYgXxk+8Ytdkw10MjQDmpBMuXmT9vokYAM9FtSLIzIlYp4MQaRtQYrPfYTE=
X-Received: by 2002:a25:e906:0:b0:91f:507f:f261 with SMTP id
 n6-20020a25e906000000b0091f507ff261mr611810ybd.463.1676557335366; Thu, 16 Feb
 2023 06:22:15 -0800 (PST)
MIME-Version: 1.0
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-8-ogabbay@kernel.org>
 <20230216122545.GE2849548@linux.intel.com>
In-Reply-To: <20230216122545.GE2849548@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 16 Feb 2023 16:21:48 +0200
X-Gmail-Original-Message-ID: <CAFCwf13c6T-S2MgwmWJkrQTwdXYDGMK+GG8ZVUjPipsXNrW_ZQ@mail.gmail.com>
Message-ID: <CAFCwf13c6T-S2MgwmWJkrQTwdXYDGMK+GG8ZVUjPipsXNrW_ZQ@mail.gmail.com>
Subject: Re: [PATCH 08/27] habanalabs: add info when FD released while device
 still in use
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
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
Cc: Tomer Tayar <ttayar@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 2:25 PM Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> On Sun, Feb 12, 2023 at 10:44:35PM +0200, Oded Gabbay wrote:
> > From: Tomer Tayar <ttayar@habana.ai>
> >
> > When user closes the device file descriptor, it is checked whether the
> > device is still in use, and a message is printed if it is.
>
> I guess this is only for debugging your user-space component?
> Because kernel driver should not make any assumption about
> user-space behavior. Closing whenever user wants should be
> no problem.
First of all, indeed the user can close the device whatever it wants.
We don't limit him, but we do need to track the device state, because
we can't allow a new user to acquire the device until it is idle (due
to h/w limitations).
Therefore, this print is not so much for debug, as it is for letting
the user know the device wasn't idle after he closed it, and
therefore, we are going to reset it to make it idle.
So, it is a notification that is important imo.

>
> > +static void print_device_in_use_info(struct hl_device *hdev, const char *message)
> > +{
> > +     u32 active_cs_num, dmabuf_export_cnt;
> > +     char buf[64], *buf_ptr = buf;
> > +     size_t buf_size = sizeof(buf);
> > +     bool unknown_reason = true;
> > +
> > +     active_cs_num = hl_get_active_cs_num(hdev);
> > +     if (active_cs_num) {
> > +             unknown_reason = false;
> > +             compose_device_in_use_info(&buf_ptr, &buf_size, " [%u active CS]", active_cs_num);
> > +     }
> > +
> > +     dmabuf_export_cnt = atomic_read(&hdev->dmabuf_export_cnt);
> > +     if (dmabuf_export_cnt) {
> > +             unknown_reason = false;
> > +             compose_device_in_use_info(&buf_ptr, &buf_size, " [%u exported dma-buf]",
> > +                                             dmabuf_export_cnt);
> > +     }
> > +
> > +     if (unknown_reason)
> > +             compose_device_in_use_info(&buf_ptr, &buf_size, " [unknown reason]");
> > +
> > +     dev_notice(hdev->dev, "%s%s\n", message, buf);
>
> why not print counters directly, i.e. "active cs count %u, dmabuf export count %u" ?
Because we wanted to print the specific reason, or unknown reason, and
not print all the possible counters in one line, because most of the
time most of the counters will be 0.
We plan to add more reasons so this helper simplifies the code.

>
> >       if (!hl_hpriv_put(hpriv)) {
> > -             dev_notice(hdev->dev, "User process closed FD but device still in use\n");
> > +             print_device_in_use_info(hdev, "User process closed FD but device still in use");
> >               hl_device_reset(hdev, HL_DRV_RESET_HARD);
>
> You really need reset here ?
Yes, our h/w requires that we reset the device after the user closed
it. If the device is not idle after the user closed it, we hard reset
it.
If it is idle, we do a more graceful reset.
Thanks,
Oded
>
> Regards
> Stanislaw
