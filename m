Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B55B09FAD16
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 11:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3843410E484;
	Mon, 23 Dec 2024 10:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kIP6L/dS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEC710E484
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 10:20:38 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-30039432861so43469141fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734949237; x=1735554037; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7BdG2KEM7N5ZoDGzjtepOxh5S9LOQZbib/ahN8MnCUI=;
 b=kIP6L/dSj+kcEOym+oZaeuIiRei2g0WP1xpucD9RwgOHUydey+YP4ayfy7e2eevhxf
 k6l9UdTIq5Wq4xo6ZY3O4B95SFprOF41qGvkGhFNGdkQQ+nGuU1WmA3dcELQRfz5J6w/
 xjaL9SokcCBoKkc/BCi++wd8Or9bOXYQWkZh+oC8hqrImIlSiaLWxrd3xZs65gLiwHa4
 Q+JK+wNpK5NDP4mANDUVmCFvnFIyMJdUiPe6M6ymBkPPPq59bjmx/UYgUkFjvZZ3yXQE
 4dlBJli0utHZ+GR6woBgiv5LMX0M0xxeWTPQuNWvhqZDe2pMOAY5eECs/lPHDC9dTyyU
 LEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734949237; x=1735554037;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7BdG2KEM7N5ZoDGzjtepOxh5S9LOQZbib/ahN8MnCUI=;
 b=xPtz2lMqZKzvpILXQH3NLjtfnny7PSn9olETg7DTQsnpmBgTCEXCEFkUI8aujb/34y
 +FCrs+aW37u4SwJe067+VPj1d/A4+xLQ697X9wTGmYIrCShQf0PrFukfKeUyIrC88W3H
 hUb4pn9DcSZAbPa+5XJtI5yJrlQIoo0/9zkco1SfO5pChmxqffIJDqZRIAE4raEGltVm
 XumdF/bY7fnrmJgKQhzPnDbuNCynUiHPcqWxWUxFJ6tvbJtH8dsgChzPACyuHSIAaaHF
 IpZ+fRc3VU7zz8y4QksIW2XMtQ7gP6rmw0RZzn8BXfAT0RU86eL56n77PiDdJS1SdyZp
 crEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWroIPMY12cUXH2kf67doLralfRCSkco+HyuFBdZ4rmvOFnfXS5xEDux3yBVSc9lWi5y3X9FypP5xo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0Pui8lr3WtTmFzGbefwQ7npkcQ10jNR+nXz13GXIJBoa3tkKl
 St9mK6D857HceL4QJbWfXbhY9i1XbnK6Eq4kAaOHpGS6HFQmARdYaw+lhloisaY=
X-Gm-Gg: ASbGncse/op1EAYyDV1RY+3MH+SpaADW1amMSqHdewD2MakcWtonWnndAC6Qdrby1rx
 JLbZ65mr+yuXCVBiYXpKFg+K7SKdzUYnAiH17ZsbhkgO99n8rd/wIqn6rUOkgvq+SFKWg2GEroa
 7x18hkh7FO3pbqiBSyKq8zYxw8hfdCXBLQHxLXzGX9tFu+/2HVDNeUhqhQYd3TfJDrUsw0xlbiu
 EwLSK+skqwrYxZTN/dWDhHmWCMTxyVR+NhKss+7WWiDWfEG0DKTOVjOp/+eIltPn7LazvmSAjeT
 LXAn0cSXFnlnAZjFCCUxuWDm6pezUQ0hgDf8
X-Google-Smtp-Source: AGHT+IEZ2NVogTrl/l2IKB2Z64bE7w+PSxM/M+cf3N5h+nH0zcZBrij9zXjP0FpluXqw3LeiTBOImw==
X-Received: by 2002:a05:6512:689:b0:540:5253:966e with SMTP id
 2adb3069b0e04-54229581feamr3600119e87.44.1734949237046; 
 Mon, 23 Dec 2024 02:20:37 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422360010esm1245736e87.79.2024.12.23.02.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 02:20:35 -0800 (PST)
Date: Mon, 23 Dec 2024 12:20:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anandu Krishnan E <quic_anane@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 2/2] misc: fastrpc: Add meaningful labels for exit paths
Message-ID: <vn3qkcc4ufc3mzpk7qakg6tfujugcvonakkvinix5q62tthmpu@pjnex235m5ge>
References: <20241223100101.29844-1-quic_anane@quicinc.com>
 <20241223100101.29844-3-quic_anane@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223100101.29844-3-quic_anane@quicinc.com>
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

On Mon, Dec 23, 2024 at 03:31:01PM +0530, Anandu Krishnan E wrote:
> In fastrpc_rpmsg_probe function, exit path labels are not intuitive.
> It does not metion what the goto does or why the goto exists. Rename
> goto labels to make it more intuitive and to align with labels of
> other functions.
> 
> Signed-off-by: Anandu Krishnan E <quic_anane@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
