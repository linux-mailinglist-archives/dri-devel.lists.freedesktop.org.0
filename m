Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B45975DDC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 02:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8531D10E97E;
	Thu, 12 Sep 2024 00:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TL1exez6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CBC10E97E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 00:12:36 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-71798a15ce5so1091462b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 17:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726099956; x=1726704756; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YRhIRnidwJmOdSjyzFN3o9E8wDi15Yl61Z0LHp95sU4=;
 b=TL1exez6jBjqbuvfCVlbKLyuxha592YAff3Z9wHIP9SfOqpgd2VNnWZWQOFSucRy3t
 DAHKop3V720nJw861baGvvHJLVUzhzPzPuIpOsqdYK6lckLNvF0m5lP7iExXheECYZSN
 BguwPYRtJO0NP7LTWdM9lGRn2wU7eY41jPXI7rSn2sUGKmfCH4cul0XTZkiNoIBYstqM
 t2U+0pNy0deMIYBisai20Qt5lzx1pb6nSl0saRM2thDQQC4i0ddxQ1f2fzsdj2XeWYr5
 pDpmPNOi04A0tMeDvYeQpQAiE8q2slHfqTmCMxPhC1cDQyIizrg6KbuUzJlN7ennXxfN
 kLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726099956; x=1726704756;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YRhIRnidwJmOdSjyzFN3o9E8wDi15Yl61Z0LHp95sU4=;
 b=wZmGzXMQcP3eQHCuWyIYyjOFssg3TnuUy6M6aYgiudpGMn2RWqqemKzl7LXtoXURxX
 YtcGn07gKnNBhYAcIsloBqCz+zrXzrdClh/I99cv4nzVZVC02MYBUm4zoK5wPLRuECnx
 GlVfD4KSgutzf+2kThAj7QMXu3G4vek9uyTtLqubXWcwEe26SAj+HtYnkWESac8utwk+
 AoJLWKTcfTAI52l8OSOwbz5yRI90uYqSB5RX3w7dqIrzHD5UheW56U//A6NP46chuXsK
 pK8gt7/ygZbHpNpXElrCAchWU8zBIXAbrmTUA2O8KtKO+4L47joddmr+0v5PmemsiLBn
 XwoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzi/m/xid2xzM50G0PSf2u6esxXCULgd4ZSxWBh72gAviPjIEwdFAf/2VTokgZWbUuPXIleugE7ww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy0LvScqIenqQTgX5XMMwvfXYP50O3QoWs4zusqlP2iLiceuPd
 FE9wruil+u5DZfCbtJ83mfomaNAuA48726pJC0sRnhr1UaDm1WC9
X-Google-Smtp-Source: AGHT+IFiWt724MUdfh6lTY2YBFQTHx49rEguXMGqwgXVrmwES84P38IbzbLYqPVXsGKTuLUxvXhVfg==
X-Received: by 2002:a05:6a20:d807:b0:1cf:6713:b791 with SMTP id
 adf61e73a8af0-1cf75598c1bmr1419212637.2.1726099956034; 
 Wed, 11 Sep 2024 17:12:36 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.234.231])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-719090c37efsm3512676b3a.187.2024.09.11.17.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 17:12:35 -0700 (PDT)
Date: Thu, 12 Sep 2024 05:42:29 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkp@intel.com
Subject: Re: [PATCH v2] drm/panel: hx83112a: Transition to wrapped mipi_dsi
 functions
Message-ID: <ZuIx7dFxMa46dapr@embed-PC.myguest.virtualbox.org>
References: <20240903173130.41784-1-abhishektamboli9@gmail.com>
 <CAD=FV=VVxWBv2oqL39j8eoRdJf42byoiUJ+XvY0kwL-OXoe0fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VVxWBv2oqL39j8eoRdJf42byoiUJ+XvY0kwL-OXoe0fg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,
Thanks for the feedback.

On Tue, Sep 10, 2024 at 02:22:37PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Sep 3, 2024 at 10:32 AM Abhishek Tamboli
> <abhishektamboli9@gmail.com> wrote:
> >
> > Transition to mipi_dsi_dcs_write_seq_multi() macros for initialization
> > sequences. The previous mipi_dsi_dcs_write_seq() macros were
> > non-intuitive and use other wrapped MIPI DSI functions in the
> > driver code to simplify the code pattern.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202409040049.2hf8jrZG-lkp@intel.com/
> 
> You'd only include the above two tags if the original problematic
> commit had actually landed. Since it didn't you leave them off and the
> Robot gets no credit (even though it is awesome).
Sure, I will keep this in mind before sending the next patch.
> 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> > Changes in v2:
> > - Update the commit message to explain the reason for the change.
> > - Correct the code by changing 'dsi->mode_flags' to 'dsi_ctx.dsi->mode_flags'
> > This change addresses a build error in v1 reported by kernel test robot
> > caused by using an undeclared variable 'dsi'.
> > [v1] : https://lore.kernel.org/all/20240902170153.34512-1-abhishektamboli9@gmail.com/
> >
> >  drivers/gpu/drm/panel/panel-himax-hx83112a.c | 140 ++++++++-----------
> >  1 file changed, 60 insertions(+), 80 deletions(-)
> 
> Just adding a note that there's nearly the same patch in
> https://lore.kernel.org/r/20240904141521.554451-1-tejasvipin76@gmail.com
> and we're discussing what to do about it there.
> 
Regards,
Abhishek
