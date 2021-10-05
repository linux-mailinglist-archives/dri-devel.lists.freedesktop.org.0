Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60531422222
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 11:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B59C6EB37;
	Tue,  5 Oct 2021 09:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EC46EB50
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 09:21:43 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id v127so15769603wme.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 02:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lGFS9XsVQotzeowyDH2izEVNspwu5x+TirGTi3ui9HI=;
 b=O8tiJpfTqnowxAvMtqY7WS9TmaOtEAhtl4qfB7Va3JldEy0GPega7a/ToJovzJAd6N
 tjkSuUatdlOoM9AgQje/T+WKupS/r/kHn+t+tSUs0hCpTYNvWt6XiIYSfp0ALiH15L1C
 BRd7UqfB4ZiJo9KpZN214o7bf2OKTFb3XZTr4BhxAEpd5HTPpnSq5GcChhdmgXYL2ONv
 IhyjMiMP6lezq+3n9OicrVWtk8YcDt5H4BWZ3uzlMOQfql0UqtBo1LTJghYDVbkaW2e0
 ykE7Vb4+F66WD6UfCBAGBetDaI2bhOdvf8fQChFLhcuOSA2v7na5oAJlB2FNg9FIVDM3
 9aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lGFS9XsVQotzeowyDH2izEVNspwu5x+TirGTi3ui9HI=;
 b=o0mn01BgDTnaVFnDpxDo04jhRSpPS0wPhuqDKXLmZqbe0qNnd7p90f1RtaFjXVnZqL
 wN1FuTD6hMIVFATfld4lhclqVoctUBF8YL5FFnmb6v0Uy5rzawUgmrLIpUMSy1WASZn2
 Lbu5OHVr5/l9RPvhMNfAG2V+TYhOKYtifyZkOpDvzCjO76AC4eQ7pzKoG2PP9oeECqFj
 xbGRX7Fo1S9VnxqDr/T/2vPxVbroT0Pc8+W5+7lzbTfg71wbbK3xWtHdq8+VAYbqJvFG
 rkyMWPGrjuLTc3mJdtigbLdBzEUBieERF9HScrwlNU30pi6VDVhOsdscXLyHgFNOvJYF
 KxEA==
X-Gm-Message-State: AOAM530AJP0KjcoOl4lWlcoeK+sZqEuFOCzQydOnmsy67o4Fa1tCwUlV
 t3L6OBcwWtT3OqQ6E0h+8MI9tA==
X-Google-Smtp-Source: ABdhPJzYlNZtJzu4a4d5vjX33BHvw1dWlUlpJZ+DmuUIXgBoBSyWnDXB4/LyXpO85m8x4okxnN417A==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr2235248wmc.59.1633425701986; 
 Tue, 05 Oct 2021 02:21:41 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id y23sm1303166wmi.16.2021.10.05.02.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 02:21:41 -0700 (PDT)
Date: Tue, 5 Oct 2021 10:21:39 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Courtney Cavin <courtney.cavin@sonymobile.com>,
 Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] backlight: qcom-wled: Remove unnecessary double
 whitespace
Message-ID: <20211005092139.rnxmmaz6xsms2vjx@maple.lan>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-9-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004192741.621870-9-marijn.suijten@somainline.org>
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

On Mon, Oct 04, 2021 at 09:27:39PM +0200, Marijn Suijten wrote:
> Remove redundant spaces inside for loop conditions.  No other double
> spaces were found that are not part of indentation with `[^\s]  `.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
