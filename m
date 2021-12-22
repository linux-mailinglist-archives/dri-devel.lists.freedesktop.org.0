Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4017447D05E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 11:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2110110E274;
	Wed, 22 Dec 2021 10:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDA410E274
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 10:56:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r17so4091630wrc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 02:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3Wks2OpuoB00uHRdh5JUOv2eXhyxD1JIeK8fHzyUvqM=;
 b=P4Xys96R8sOLs5LvpYi8S+iGyJy/CyJ/hliNHjWaDR72pb5VG5lXrnhBXmj4y0RlHX
 4v9sLZtMm8BVyxq+sRO25uelCX6izdp05ULp9hvwm/Mglo8UYDote5AH36detwLyX7Vm
 mUvXr5jvb1YHSfeHVoPa0KzR46C3uFcGlEGAt7GFJWZdQ3iVBAgP83nrolccxZknIuWW
 dCuuv1cj9ZlhKQ5xb/0JrTTtUe1cufNZnJX0cPDPa6p5zWK+99K/zeKfTycRnnXgyO5M
 8dza5aq6D3S1rkIrUbC8l5cPMlq0UCY/lzfkJHQcOjH5CvLXP44Cglx13sliu0dbxC+d
 a37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3Wks2OpuoB00uHRdh5JUOv2eXhyxD1JIeK8fHzyUvqM=;
 b=jS21imqyIRlN5Jkv4AE2cIwavOjjySUaxKI1cb5XjnGep+0H4j5ZpBOZbQ2h0BMGrR
 FtTWncXAQom4AXNYu+4vvrIisvclsv4/pSCme+uefiq4rMw/2BEEsyzcTdZNSE3wnIcu
 MvcV7ZfW0gmnRvs2MVZDPvs25XDkXCfjkLeASnt/xmHSSnwGG3lTs8fOsNBXxaOw9jtL
 OUlJJH+Fr809aCdmovx68/FyB3vkF5YsZAfrrNGZ25bPh4KehJflXkyRfLYNhDWA9cD4
 I6okM7EJQar/2LJg71KDMT7qP/A0yryTps7JkS5r0QsqnRnPRVkqVar3+zK5gi1O8J3I
 8aXw==
X-Gm-Message-State: AOAM531vcYQWMa6GWjrknIxqzxNywXmsjd5QaSZs/JYlzOfrr1jDKtNJ
 ipYlIalqzVdgr0f45RyXdR4vpw==
X-Google-Smtp-Source: ABdhPJzPy9qHrxvmsh7Kw2oL3n3gfjoGIN/UMGaa134hOuMY2k9I3qz20YIwWw5VJKZnnyWplusSuQ==
X-Received: by 2002:adf:bb4a:: with SMTP id x10mr1714179wrg.269.1640170606402; 
 Wed, 22 Dec 2021 02:56:46 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id l19sm1507984wmq.22.2021.12.22.02.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 02:56:45 -0800 (PST)
Date: Wed, 22 Dec 2021 10:56:43 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Kiran Gunda <kgunda@codeaurora.org>, Bryan Wu <cooloney@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 0/9] backlight: qcom-wled: fix and solidify handling
 of enabled-strings
Message-ID: <YcMEa7aEXKrgjwuG@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211116120213.n7qxqfi62lrxhyl7@maple.lan>
 <YZPRV2jD1EBYGdHL@google.com>
 <20211221233131.rwjjojuawgffr2gf@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211221233131.rwjjojuawgffr2gf@SoMainline.org>
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

On Wed, 22 Dec 2021, Marijn Suijten wrote:

> On 2021-11-16 15:42:15, Lee Jones wrote:
> > On Tue, 16 Nov 2021, Daniel Thompson wrote:
> > 
> > > Hi Lee
> > > 
> > > On Mon, Nov 15, 2021 at 09:34:50PM +0100, Marijn Suijten wrote:
> > > > This patchset fixes WLED's handling of enabled-strings: besides some
> > > > cleanup it is now actually possible to specify a non-contiguous array of
> > > > enabled strings (not necessarily starting at zero) and the values from
> > > > DT are now validated to prevent possible unexpected out-of-bounds
> > > > register and array element accesses.
> > > > Off-by-one mistakes in the maximum number of strings, also causing
> > > > out-of-bounds access, have been addressed as well.
> > > 
> > > They have arrived piecemeal (during v1, v2 and v3) but all patches on
> > > the set should now have my R-b: attached to them.
> > 
> > I can see that.  Nothing for you to worry about.
> > 
> > I'll apply these when I conduct my next sweep, thanks.
> 
> Thanks for that Lee!  Has the next sweep already passed by?  Seems
> everyone is preparing for the 5.17 merge window but these patches
> haven't yet landed on the backlight tree [1].  I'd appreciate it if we
> can make them appear in the 5.17 window :)

No need to panic.

v5.17-rc1 isn't due to be cut for either 3.5 or 4.5 weeks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
