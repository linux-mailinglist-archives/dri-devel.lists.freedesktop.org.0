Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A133422DE6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 18:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59666E42F;
	Tue,  5 Oct 2021 16:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567DC6E42F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 16:24:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e12so18109362wra.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 09:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=O2knaCuIcm4g/kvK81ZD/R6KXoMPxp2/YvgHHKTs1+8=;
 b=wJTAj7m2dGVL+MDe+OYbV185CZIVcPsvizMm9yOYOkRZBWGZ1eOM+Z77UNAIGFlWUz
 o+LVyS8dTEjT6BZ86quSwR0BoaGmL9zNjpb8ZljUV0HkS7laqmM1RPy85BRYZTD2Ytbb
 IJ22/h9Ka6SP82RQwncj2hOGnHgTGhSv1y5FUDdqPyHRcMFVL6T/o8I3rCfZKe9yePKf
 VLID4rXd3MVaVFghx90PVFGUKsx5OC9svXsximxhCQDGFzvq4bkVrUdjO1zLkzyeEqpm
 TmQhz8yC1hXId3TX4hbsnNm+6lakvo5GiMRkBZk+SvbcQW62MpccMm7GhHxeq79hEoMU
 RLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O2knaCuIcm4g/kvK81ZD/R6KXoMPxp2/YvgHHKTs1+8=;
 b=PmQW6sxPg1bQC4edX6MLF3Bs4WT8IcasQuu7bQNFayQe9w7mtZlrmE8z/vHpDeDS2l
 1kh3IV3nsrdI3psxAAX2XfK8DOwvSMxuKwhtUYhUsy6u90vIoCIH5ZoCcWxaUpgU/s9l
 9+ZffPmaf31dLXgjT2VWhBkUR+VLvVZuCbKONOlIb277hVKW42a4ABkMmxgMSUTQGvqO
 eSBzMWtZcxHvF2vwk1VWVeek5S/4yAgKaNuc+8KE3t7buABhu76NF8dMOd15Bhr3RTAs
 BKrcpElz/PiQKkh9PLXHzSjpad0Kuam3aBgnY0ZmdqsU+Q3WV+U9+63eppQjLvl+vwRG
 367w==
X-Gm-Message-State: AOAM5320HG//ZVvVLjw8GOrGpexGz2oSjQmSfoLpjW7F+yTySQvp6ly9
 KJSBcIRlkVrnj8pEftDys6rNHg==
X-Google-Smtp-Source: ABdhPJz+P2+x220j7T2l+shkjZv/CKb3ndz9Q786geSvOif2DjMhH0MAHjlt0xx1WUZlLp+M1vmCAA==
X-Received: by 2002:adf:a48e:: with SMTP id g14mr18915437wrb.11.1633451095666; 
 Tue, 05 Oct 2021 09:24:55 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id l21sm2359005wmh.31.2021.10.05.09.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:24:55 -0700 (PDT)
Date: Tue, 5 Oct 2021 17:24:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
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
Subject: Re: [PATCH 05/10] backlight: qcom-wled: Fix off-by-one maximum with
 default num_strings
Message-ID: <20211005162453.ozckxhm47jcarsza@maple.lan>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-6-marijn.suijten@somainline.org>
 <20211005091947.7msztp5l554c7cy4@maple.lan>
 <20211005100606.faxra73mzkvjd4f6@SoMainline.org>
 <20211005103843.heufyonycnudxnzd@maple.lan>
 <20211005105312.kqiyzoqtzzjxayhg@maple.lan>
 <20211005114435.phyq2jsbdyroa6kn@SoMainline.org>
 <20211005140349.kefi26yev3gy3zhv@maple.lan>
 <20211005152326.5k5cb53ajqnactrg@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005152326.5k5cb53ajqnactrg@SoMainline.org>
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

On Tue, Oct 05, 2021 at 05:23:26PM +0200, Marijn Suijten wrote:
> On 2021-10-05 15:03:49, Daniel Thompson wrote:
> [..]
> > > At that point one might ask why qcom,num_strings remains at all when
> > > DT can use qcom,enabled_strings instead.  We will supposedly have to
> > > keep backwards compatibility with DTs in mind so none of this can be
> > > removed or made mutually exclusive from a driver standpoint, that all
> > > has to be done in dt-bindings yaml to be enforced on checked-in DTs.
> > 
> > So... perhaps I made a make offering a Reviewed-by: to a patch
> > that allows len(enabled-strings) to have precedence. If anything
> > currently uses enabled-strings then it *will* be 4 cells long and
> > is relying on num-strings to ensure the right things happens ;-) .
> 
> Unfortunately Konrad (one of my team members) landed such a patch at the
> beginning of this year because I failed to submit this patchset in time
> while it has been sitting in my queue since 2019 after being used in a
> downstream project.  This is in pmi8994 which doesn't have anything
> widely used / production ready yet, so I'd prefer to fix the DT instead
> and remove / fix his comment:
> 
>     /* Yes, all four strings *have to* be defined or things won't work. */
> 
> But this is mostly because, prior to this patchset, no default was set
> for WLED4 so the 0'th string would get enabled num-strings (3 in
> pmi8994's case) times.
> 
> Aside that there's only one more PMIC (also being worked on by
> SoMainline) that sets qcom,enabled-strings: this is pm660l, pulled from
> our local tree, and it actually has enabled-strings of length 2 which is
> broken in its current form, exactly because of relying on this patchset.
> 
> Finally, we already discussed this inside SoMainline and the
> number/enabled leds should most likely be moved out of the PMIC dtsi's
> as they're probably panel, hence board or even device dependent.
> 
> > We'd like that case to keep working so we must allow num-strings to have
> > precedence. In other words, when you add the new code, please put it at
> > the end of the function!
> 
> Since there don't seem to be any substantial platforms/PMICs using this
> functionality in a working manner, can I talk you into agreeing with
> fixing the DT instead?

I've no objections to seeing the DT updated. However I don't really see
what benefit we get from breaking existing DTs in order to do so.

"Cleaning up annoying legacy" is seldom a good reason to break existing
DTs since, if we could break DTs whenever we choose, there would never
be any annoying legacy to worry about. When conflicting properties
result in uninterpretable DTs then a break may be justified but that is
not the case here.


Daniel.
