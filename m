Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC7938B31
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 10:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1B710E40F;
	Mon, 22 Jul 2024 08:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EgM4mymT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F3F10E407
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:26:09 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52efaae7edfso1078289e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 01:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721636767; x=1722241567; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9i59AQP++/YRGTPfGm6YkbyUGnPVvAGTVEhOYab+5TA=;
 b=EgM4mymT1aAJBFIrgymn31MHcIdDxHAyB+6/IgS5KqjecJcBeEprzCyMZXEsSB/xUs
 kz6hN5mixuQAJQAMpgsTHpO19F/ecqiH5aPBMu9vRdnPGV55SOYv1kdKH8Orr1UBE6Ag
 6j/7hgGfJosbqLjJ5RmCwQDAdBD5K5lMdWLw4EcotpFW60i/EbCbhR85AJAJMJxU9jbx
 qzW7127UrGGzAawL+VGBfKET4gcLfY0CqkBRwObbSzV9CGB10TUMHZ9NkGgBKaV+7FCw
 2dGb2FvtoHKwK4dkHSxHyYMb7X4ZLGR/nDUCdy4aca7X2O6D94olLGWF3o2eTg6XHBG5
 4ASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721636767; x=1722241567;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9i59AQP++/YRGTPfGm6YkbyUGnPVvAGTVEhOYab+5TA=;
 b=W21kZKHtzNBfM7Z/UOoqkXQ6WgXKA09WlAX2al8qXGBMaltEXKpJEL+1KQBrjKpSFD
 zGYoLVJbj4EfihHI0GQJ6O6b/qJzUE5oUPMpaclU8sQ091HMotIYNye6MERuFgnn7XDF
 svUtYXF4ZO8nVyvaFoN1m+clIBCp2oUdev++WcOwxoxh8k1FZqqfzWL5BW0bVotthBl+
 Y3uufNafeRo2/rTtTep+z82iMDhjFhtmEfsUTyrqDmONDevijcsIcsq8543Uy7eVvb1q
 iJJYAYhZxY9YryiyKBU9yvvIO9aYpWb0buBgGlljVNHBOgzMrX0YXPt5+7Qfr0EngabF
 fMtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG/AM/Qv73NhJpPku2/41uUBuNina6PcmHhSNicg9pDQwy1lUKUyUHLG+wROGt6zxGr+crM3eRhDihTywkeCv35VRRfHrpZQyRMc14HzzF
X-Gm-Message-State: AOJu0Yyd2nFKuRgiD8GK7WVdlM7wrdzv1TW3UO+wLMgFC+cup5j4s34n
 PAH9Rp3NSNnFbfUYNN/WWTvve3ONfIZADqRJtwFU5+08FmR5ieeucLGvZINeYYNBFm3k1weRlyT
 u
X-Google-Smtp-Source: AGHT+IGjp1w8oxUvbHbWkFg1OXnsIAY0YlwajfiBz5xRohJSi7smqlVbkyJAJWclepJZZfm7iVRypw==
X-Received: by 2002:a05:6512:2392:b0:52c:88d7:ae31 with SMTP id
 2adb3069b0e04-52efb89cfabmr3853544e87.48.1721636767397; 
 Mon, 22 Jul 2024 01:26:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52f041e0bd6sm282010e87.198.2024.07.22.01.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 01:26:07 -0700 (PDT)
Date: Mon, 22 Jul 2024 11:26:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v6 0/2] Fix user PD inimem requirements
Message-ID: <bob3pkwyu7g3qf4q546uittggzfywc6o5h7b73isx4lijsfj4j@h3uqpaevawgg>
References: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
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

On Mon, Jul 22, 2024 at 01:31:58PM GMT, Ekansh Gupta wrote:
> This patch series fixes the incorrect initmem size assumptions for
> signed and unsigned user PD.
> Previous single patch[v4]: https://lore.kernel.org/all/20240719085708.1764952-1-quic_ekangupt@quicinc.com/
> 
> Changes in v2:
>   - Modified commit text.
>   - Removed size check instead of updating max file size.
> Changes in v3:
>   - Added bound check again with a higher max size definition.
>   - Modified commit text accordingly.
> Changes in v4:
>   - Defined new initmem specific MACROs.
>   - Adding extra memory for unsigned PD.
>   - Added comment suggesting the reason for this change.
>   - Modified commit text.
> Changes in v5:
>   - Splitted the change into separate patches.
> Changes in v6:
>   - Changed Unsigned extra length macro name.
>   - Add comment in proper format.

Please allow reviewers to finish with the previous iteration first. The
usual recommendation is to send new iteration once per 24h timeframe.

> 
> Ekansh Gupta (2):
>   misc: fastrpc: Define a new initmem size for user PD
>   misc: fastrpc: Increase unsigned PD initmem size
> 
>  drivers/misc/fastrpc.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
