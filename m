Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8D1A9BEF0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 08:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B0410E04F;
	Fri, 25 Apr 2025 06:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CV13b6jH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CD010E891
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 06:53:14 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5f728aeedacso370786a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 23:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745563991; x=1746168791; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KO65CEx+RcYydFr/CzyZwwMVrrbrsdRqExGbOK/+azg=;
 b=CV13b6jHTo+sJjo8SC/Ush3m36tdTdjLLDeZJiFg49CbdJTVA7PNUtEbdFbLeeK+Ce
 MBnx7OgzgxZv/Pe7fp8SpfNqJPqPBGbVxlpIp+VgQnc2vhsTStCw64AdZwuW5M1hK3+p
 GuggHvzFf/EHeaf0e8TNAQO+H6aqr3NO8Zo90x+GFaglLXmBWsiCQpl7HsFJNIaZHHcI
 sYZvySehg/I+/+2pYH75PczrY4DOYrHjsUHTVbMpX+x8dlXv95H3ZD8BhW3wPxp1HteE
 OywRBGFiXGPkUeFkOFia75q2IJnEdwJgaWFyCUw71ir0gXI020qFmp1G1eM1LNTQBS0+
 vBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745563991; x=1746168791;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KO65CEx+RcYydFr/CzyZwwMVrrbrsdRqExGbOK/+azg=;
 b=GnagGN9NBOkLJbu9q+orRRQq13qxI6Jg2QN5AvnlSUBihS+mx+UJfXLdXf9Sti2Tcs
 tiMYCMzmdlDFeqhr+/MipTFe8FjLC8cGiubKcoK7nDgI9ZXUL78kJ4NoqGHmG5OATV8W
 jgL2QnO84+Yyewsrdm9R8abCuhGBIytjn2NkeCEQ/nKoW0f9++bvLQ2bo+P1kLBt+y8t
 WhXGOhpMM/aRwkZodli3cCp7fKVz5khQQTzFxn99XCTfCTUlfdhiUQsN2CwReDQAXsHK
 tPJv0faM5u/1/Gt1OEtbnDP/x1XLVLO41EWn4zqKNfS79Wa6sw6bI5h+BKdaPDoM43tK
 MFug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYjQJofH5kU5sKuzoZaVqrc9nwyFTZ3iWbDKHts8TjRNNJHn0qiBAbPxH1rxVQZVlHxIQJXCd1rRo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzzpurw7vRl0illYnWgLVUADqaKe4g/vmQU6lIan8wNTIujcJ0B
 EPBscVzNE8Dda3imriG4RgOuVOOFaH9gLS17mg0CMpzDcrx2hTamLJWsIPFDHo0=
X-Gm-Gg: ASbGncv9DUPu7teV0a1co4aezhl2L5GSBmHWqwOAcGR1A+5Kc+kNTSSU9VbpRjE4jjm
 PiIxYt5XV1rEK2IzpTpDnRlMOArv84/ATUA6cOWhAYD+pkmw6xfpl9aU1omCL3b15FNRzhyPyby
 fAKPc2RVEKLQJAOXn1f4Jf9Lg7Y7m7GGoNQ9XH+pdDODuBKbbjU8tpPmco4mTGNf/c0A4cq915b
 olx2lv8nEBQUll7zRsSn6ozWOsWnF+MNcSITsrQb41CPkR78vjdoEqLyxhrbNvww/ipR0nGzRmK
 omoFQcgs67SlcoXogXbFUKUjcKndXSg1Kai/1w==
X-Google-Smtp-Source: AGHT+IG58VzDkGFhm8Z0pviWxJ++MDZSR0fg5sx14OLcY5mVRrQMI1meGNjl2MrGAtIugid/tRuBDQ==
X-Received: by 2002:a17:907:9485:b0:ac7:75ce:c91d with SMTP id
 a640c23a62f3a-ace7108ac55mr108123666b.15.1745563990935; 
 Thu, 24 Apr 2025 23:53:10 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6edb1ac8sm82529766b.182.2025.04.24.23.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 23:53:10 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:53:08 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, johan@kernel.org
Subject: Re: [PATCH v3 3/4] drm/msm/dp: Prepare for link training per-segment
 for LTTPRs
Message-ID: <aAsxVGtW+yNlFd5P@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-4-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-4-alex.vinarskis@gmail.com>
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

On 25-04-17 04:10:34, Aleksandrs Vinarskis wrote:
> Per-segment link training requires knowing the number of LTTPRs
> (if any) present. Store the count during LTTPRs' initialization.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
