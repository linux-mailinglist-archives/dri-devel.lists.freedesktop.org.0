Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D2A9FD2A0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 10:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120CE10E1D5;
	Fri, 27 Dec 2024 09:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HraiSMb+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1978810E1D5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 09:51:33 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2166651f752so96310995ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 01:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735293092; x=1735897892; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Z3kIYYav1PvSjIUXIDnTln9if7PNCtkeq4PzpUXJ76o=;
 b=HraiSMb+mqF0Wq+VS4uLmcySGV8XERE3VxZm5KxtQnANRj7Cp5g0JpbPUo1C0t0ri9
 maxCsD4KiSnOvfBKazm+3MESDJsJT4jLmkw7v3OlG7Z9jLa8bLMb3tQejEZUUQJmi/Xb
 gja4925Lcjc55XTbhPl4CzLnHaW2zBLKvMsWGJCS66sRZ/5LoWfYSs7AtWnnLPt7PAap
 hsO5K3p3mO8K+QrY6/EHXK40ccgL1cHi+ord151btdMy0cCsD1pWXX+K2RAUpILnetAl
 DFHhbA7g/a23ZN+1w+UiTOjys1x7EnBhuhpZQHz6uO3aG10Yho395NSvnIpRCA4hNl1D
 1F/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735293092; x=1735897892;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z3kIYYav1PvSjIUXIDnTln9if7PNCtkeq4PzpUXJ76o=;
 b=qPDQP/H8maM8j3bBeU1qmt+meUOwACLxWJdlzd+FLz7v5g4c139kLvr53hIFdMtDLJ
 Y55o7BEZ38talugruURw9fbYnnSr7SqL6kdjbH9lKZaWS3mvI5Wle1ouAg+PghLAJ6Aa
 jl5m5nYV7+EmGtp3UvedxCJ3Aj4Tn1NWpIpMAwzPb8P0iLWAIki6IpXIFGSzPrAaKJr/
 Qa9ldf7OtynTHRk+R9gykRKcsHXEGcSZ32NdoPctG5ceprzXbzC/qWjg2htLrMyM7FW6
 uIAJScl1v7w3ym45Hi4cq3q6WL9cL/eWV0N62GUSLCIfcomaDkowryW+6edkDh/w7WTt
 2z2w==
X-Gm-Message-State: AOJu0Yzng+8oEBTxfJh/zY+Q+r+RsQxh5VwtYE34puoI55Qj2KlgDdRp
 3y2u9jgtT5Nat6f4HziOK83fO6sJsY2r1Fn6XoX7GuJz2TFR9P2V
X-Gm-Gg: ASbGncsmLJczFhTu266pkarR4qE758NUCmn+cfr+OFIKX2mxJWJoz2zWu1DM0Wy/cKu
 CBhFbWXGOO/m6CfysKNq7RpxmeNQtO9ZtruPWSNKgiAiC/VyZPF9/Nf65+oM1DejtSiPlgeew10
 iGAhlHG5yGCrZpPRlQayOxGEsOvP9R2c7cBK7shAgT16LAZ7tw2Y8hRCsOxUSjoZDHwQiKIIL9P
 kxMcvIhuzjQd83XuYFLQCHKiGlTQuFQLLjLyNaLwzsFjwggbW9YVck=
X-Google-Smtp-Source: AGHT+IEVi84xuzWlTMjO2IGoIG2twBfofQsLs9LiHnpA4f3sHHWIHQkG8qFuCXh50GuernODq6lMuA==
X-Received: by 2002:a17:902:d4d2:b0:216:31aa:12fc with SMTP id
 d9443c01a7336-219e6eb5bf4mr327982705ad.24.1735293092447; 
 Fri, 27 Dec 2024 01:51:32 -0800 (PST)
Received: from Emma ([2401:4900:1c96:94e2:5054:ff:fe53:2787])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9f518asm132439505ad.198.2024.12.27.01.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Dec 2024 01:51:31 -0800 (PST)
Date: Fri, 27 Dec 2024 09:51:25 +0000
From: Karan Sanghavi <karansanghvi98@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
 Simona Vetter <simona@ffwll.ch>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
 LKML <linux-kernel@vger.kernel.org>,
 CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: Initialize pointer before use to avoid
 undefiend behaviour
Message-ID: <tte6ad3rxle52x3wndewyyrnszozghvpxktx2x55w26rdcea4n@rdbhzpx2wi3p>
References: <20241111-uninitializedpointer1601557-v1-1-7d03668e8141@gmail.com>
 <8a5bdda5-5e2a-4b73-91a5-849b6060e7df@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a5bdda5-5e2a-4b73-91a5-849b6060e7df@web.de>
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

On Tue, Dec 24, 2024 at 05:09:54PM +0100, Markus Elfring wrote:
> > Initialize the pointer with NULL as mtk_drm_of_get_ddp_ep_cid
> > function might return before assigning value to next pointer
> > but yet further dereference to next can lead to some undefined
> > behavior as it may point to some invalid location.
> 
> * You may occasionally put more than 62 characters into text lines
>   of such a change description.
> 
> * Please avoid a typo the summary phrase.
> 
yes sure. will keep that in mind for hte next patch. 
> 
> …
> > ---
> > Coverity Message:
> > CID 1601557: (#1 of 1): Uninitialized pointer read (UNINIT)
> > 3. uninit_use: Using uninitialized value next.
> 
> May such information become a part for the final change description?
>
Ofcourse, it shouldn't be the part of the change description. Thus i
have added them after the '---' due to which it wouldn't be the part of
the commit log (that's my uderstanding correct me if i am wrong). If it
still adds in the commit log do let me know as it hasn't been added for
other patches. 

it is just for the reference to understand more about what the error message
is generated by coverity scan.

Thank you,
karan.
> Regards,
> Markus
