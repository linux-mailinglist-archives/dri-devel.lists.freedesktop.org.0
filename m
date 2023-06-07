Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63192726321
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 16:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D5F10E511;
	Wed,  7 Jun 2023 14:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4DB10E4FE
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 14:43:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-30aeee7c8a0so577519f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 07:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686148984; x=1688740984;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TgVx/ivppv/BoC/MHBYYnozcIe3rB0Gk/93SvU0ieGk=;
 b=iH7pl4QNui1hU+6JKz4/bUDAgdQYy03ZueQYLgxmh6OIy3u7Gx1wldh/KcHEiq+6kz
 /Vk/iu4XBqjg8U2XjuWn0BAvz2yomQV6DTDLPaBt33TM9xnkL7KTx6+9QfRjnYiWBxxP
 7lSGdu75EAUROtZNp1GiMCDTtrtLbEhh80noXR5Aq/52MX9Ya4ep1h65dqGxo0Vcy7ht
 Z2/KZzISCKKxY1U2ltcw40/Qkjlq+Soeu5uwySeDDck2fgWOMg/GHSxmVpqJ+rBfK9wN
 nE/gVlqnGX9oc6g6K8O0S4FytYEa4LnLPDFLy8G/8gsI6tD7tWXy2REN47hPUqFGwVZI
 96Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686148984; x=1688740984;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TgVx/ivppv/BoC/MHBYYnozcIe3rB0Gk/93SvU0ieGk=;
 b=TaUz3+PbKcz4+eowyk1fp3pfbZwYezappEGAr6YdQja2skNzYiqU/Oe34TLcacMBa9
 aRAhAe+4T3kh47S/r2yAPUwDiI5dL8Mn8VDEQPpKr4NdsT0rv+4ZGdHsbZHSLeuE5GSu
 FvOEwfNk2vUDOllA2zxqS2Ycg66E/RpFSM5la5H22U+uoS0TguP96UznvGfYGOlTUUrm
 OakbLI8F6MwNtgfmabUFwp3k58W6uzfMy1PGWybohcklTwN7vuccwi2xtlfaxQujrI0S
 WvQmx/OtDI64Nhh65mQyQAe2oNjss4bEJaSX1u61OoeITWSDpE2M2Af9q4o4jByGZg7v
 jfLg==
X-Gm-Message-State: AC+VfDx605aHdvGkmg89m0yZC4oKd+UnnTFNVH02uOUI302CbjK4suMH
 zYON8uPsZX8/sODe2xvHkTuAmA==
X-Google-Smtp-Source: ACHHUZ4BJFkUr8BQPVvtoygEGhGFQ/34JaENFvbKrT9Mxiyyf1zIQ0xfupRRBYQHPNv3qH+L0Ngz+A==
X-Received: by 2002:a5d:458c:0:b0:309:5029:95a9 with SMTP id
 p12-20020a5d458c000000b00309502995a9mr4791008wrq.32.1686148984213; 
 Wed, 07 Jun 2023 07:43:04 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 j14-20020adff54e000000b0030aec5e020fsm15785659wrp.86.2023.06.07.07.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 07:43:01 -0700 (PDT)
Date: Wed, 7 Jun 2023 17:42:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH] drm/msm/dpu: tidy up some error checking
Message-ID: <b27d016b-ff87-435b-8341-45a4369049fa@kadam.mountain>
References: <ZH7vP2Swu8CYpgUL@moroto>
 <gkeclhi5ouudxiwbd6wds7y2svtdcamyuqcnk42z7hr2js52qh@25ox3nxgeuzp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gkeclhi5ouudxiwbd6wds7y2svtdcamyuqcnk42z7hr2js52qh@25ox3nxgeuzp>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 06, 2023 at 10:23:46PM +0200, Marijn Suijten wrote:
> > @@ -359,8 +359,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
> >  	 * frequency divided by the no. of rows (lines) in the LCDpanel.
> >  	 */
> >  	vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
> > -	if (vsync_hz <= 0) {
> > -		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
> > +	if (!vsync_hz) {
> > +		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %lu\n",
> >  				 vsync_hz);
> 
> Nit: no need to print the value here, you know it's zero.  Could be
> clarified to just "no vsync clock".
> 

Yeah.  That's obviously not useful.  Sorry, I will resend.

regards,
dan carpenter

