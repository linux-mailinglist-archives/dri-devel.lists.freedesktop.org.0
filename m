Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABAD727E8E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 13:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A06C10E06A;
	Thu,  8 Jun 2023 11:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E08B10E06A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 11:14:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f6e13940daso4151985e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 04:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686222850; x=1688814850;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y++8eb57xKQGjRxPQt0BHBMYouZ1Xv40QTV3/gF3FiQ=;
 b=esU7Vh/MUaKl3oy5Ki0cEC9fkOn2Oocdcw9MXRFD9yAUSPTazhIw/9+VE5DaSap8V9
 28/kghfeYMato8IDNpc1eOamE5JHi/X0oR0t6GTQB+BJvoT7JBMHHQIaHIn+BLTbMzub
 wc9nyVl70H/VuEJXmhnEoQOZT21bygy6zt+6D/TB7r755HJeAFkoI1DFNGz1Myv0wh+Y
 1DT6xLn5nDVsjHJEgbwMUULNzcBJCToBs9LVKeRxHz2iU+ne+TufpQXlr3hgq3C3Xky7
 Zwt7gIBDFqiqwkDg0hcZ4WpqFhg4E1fwzZwCm2E6C47Qhy2wkz0+zzN6Tr9nAs/bLYjZ
 0GWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686222850; x=1688814850;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y++8eb57xKQGjRxPQt0BHBMYouZ1Xv40QTV3/gF3FiQ=;
 b=EF5jEpUQ+5CS9sqKue6HERM8XlcVX1j9FDnglVpqmiubb3uIXRnTakGeHXww5lcw4G
 5XFBFb7uMIrFd2Y+rjMhVfejB2/yTD8ZOLWz4530Qylv0tQbAjXFMiBtTNNYzrkekpsv
 UwfhNFzC9Y84tH9/LOBYdOFO5STNPnly/vhJTL069/VButPR/8o29RRpY+ZQKi9rc1PK
 IGMi9gdLZQyj4yaxGPK6njMwr+Uw0IKaZVq4V7UEtMSz7HbsK/F+JbFZ7qUT50DPlcbx
 tJlOsI/BX/dLgOKVW/ZtUXY66Ib1Xq90jKwrbmfz6ZlWBLIkXvEHJ6jSvoR02gPJT2i4
 5SqQ==
X-Gm-Message-State: AC+VfDyW2vg0eGbvr+OMiQZeUTS/WJHQLse6c4ZVfdA+BObZ6K1zWXnR
 Wm41GYWLzPCAaHWrtk3CxryrrQ==
X-Google-Smtp-Source: ACHHUZ4cjdXO5JTxcfyxQqFPmsPBxjeh8SXKmJh6VYrhNwxY63eQEPyo/CpgsMtF0fbFji57EFKWNw==
X-Received: by 2002:a7b:c38d:0:b0:3f4:16bc:bd19 with SMTP id
 s13-20020a7bc38d000000b003f416bcbd19mr1287567wmj.23.1686222849841; 
 Thu, 08 Jun 2023 04:14:09 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c28d100b003f727764b10sm1696661wmd.4.2023.06.08.04.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 04:14:08 -0700 (PDT)
Date: Thu, 8 Jun 2023 14:14:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: tidy up some error checking
Message-ID: <0a28b64f-e403-46a8-81c9-d1665e8d6948@kadam.mountain>
References: <ZH7vP2Swu8CYpgUL@moroto>
 <gkeclhi5ouudxiwbd6wds7y2svtdcamyuqcnk42z7hr2js52qh@25ox3nxgeuzp>
 <b27d016b-ff87-435b-8341-45a4369049fa@kadam.mountain>
 <b7762fab-ba49-3929-281d-ca57280e31fc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7762fab-ba49-3929-281d-ca57280e31fc@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 08, 2023 at 02:26:14AM +0300, Dmitry Baryshkov wrote:
> On 07/06/2023 17:42, Dan Carpenter wrote:
> > On Tue, Jun 06, 2023 at 10:23:46PM +0200, Marijn Suijten wrote:
> > > > @@ -359,8 +359,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
> > > >   	 * frequency divided by the no. of rows (lines) in the LCDpanel.
> > > >   	 */
> > > >   	vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
> > > > -	if (vsync_hz <= 0) {
> > > > -		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
> > > > +	if (!vsync_hz) {
> > > > +		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %lu\n",
> > > >   				 vsync_hz);
> > > 
> > > Nit: no need to print the value here, you know it's zero.  Could be
> > > clarified to just "no vsync clock".
> > > 
> > 
> > Yeah.  That's obviously not useful.  Sorry, I will resend.
> 
> I'll fix while applying. Seems easier.

Thanks!

regards,
dan carpenter

