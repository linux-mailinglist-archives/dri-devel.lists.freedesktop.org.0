Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E467A4E98A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 18:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F211210E674;
	Tue,  4 Mar 2025 17:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lo5jZC3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85A810E655
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:43:17 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id 4DEDD40D0B9F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 20:43:16 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6g794bwbzG1Vv
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 18:47:49 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 431FA4274D; Tue,  4 Mar 2025 18:47:45 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=linaro.org header.i=@linaro.org header.b=lo5jZC3i
X-Envelope-From: <linux-kernel+bounces-541081-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=linaro.org header.i=@linaro.org header.b=lo5jZC3i
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
 by le2 (Postfix) with ESMTP id 941F642B72
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:14:33 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
 by fgw2.itu.edu.tr (Postfix) with SMTP id 6B5B02DCE0
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:14:33 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by am.mirrors.kernel.org (Postfix) with ESMTPS id AC7F618906A8
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 07:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0941EA7CE;
 Mon,  3 Mar 2025 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lo5jZC3i"
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D628152532
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 07:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=209.85.218.49
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740986054; cv=none;
 b=KRV2/DMRuvRMOBkdsfWjTr72BJ2StqBOlJHiLHTS/E8YRWp3Xf0EBNfS7G988niBJNoYQiBKU88pB8pBAFzGTKEe5kkD3fAqDuQCUf+T7HFVrNTbG7Fqi8OHs8ltPSCG6Co17caVxKyDUPlB6PEfoqZW7BHi1Fc9cFJlONlLmE0=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740986054; c=relaxed/simple;
 bh=Hln+g5OCHrAMOq/+1aDVAlOsgByEM+bWM9zySDltuR4=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To;
 b=MHYtVqA2LgE+n98yhdCz4a6qsOjVvQnaagXueQcIqqfsYbDHFydHgyPGrUWlpgM5E3/dMvyEV/mi7dF9IG4l2SFK9RxFvlFdsMKXy0c+Q8t/F8f+GUSr3hkrYS4ZsrvRgPLq9Qz8EWruCJgFAbEDhmueaMo10mhGpnYnosf9rqo=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b=lo5jZC3i; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-abec8b750ebso710486466b.0
 for <linux-kernel@vger.kernel.org>; Sun, 02 Mar 2025 23:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740986050; x=1741590850; darn=vger.kernel.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8RROaO6yARYWUmuYiLttBRg0vezrYJsF0zsoMASJ+Y0=;
 b=lo5jZC3iAcg9TiASEN+02v8tjNCnIVO65YHcjQRfQveoHu178Vz4pycEF2VX+IMf1N
 qVjKOMdtBeG1S5LjTzJrESdeRo8xG0RwJnTyUMV5NV3DfAMSh3hUdACUGlxF7uuqzvuV
 q1Mtm38cTmfNA3U0vbvUKUONHRBoOI+RDB4J73PWf+7ikbFfIAZVliX3S3ZJh/uBpSfQ
 csU6x/97ZIR9KzXPZ6JMwqWZjeT8NFz6VqvWxH2fplDnXAOIEVAtR3CtiAiscZUsdZ9n
 zwSBDpFAFoxZ3XJYliPKS/+AjC0Fs1eROjFVnqa1BAmBdok7E+48ekfPKMlPham2XFXA
 aRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740986050; x=1741590850;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8RROaO6yARYWUmuYiLttBRg0vezrYJsF0zsoMASJ+Y0=;
 b=FjN6aqlc+dLJY3AFYj+gy6X+7xUXaKezIjE5lp/KxMGDQcbHcUDPeStmsPdzdC+1C5
 r+/D9Jo5v20TEj5S3GZG3hcxev53jhFXEtjPKhyF+WD85j2CYIDyvLilMNUUZ6eCCUKR
 AKgUGaFP/NOlJL3Z0cqBJf+gIMv9LNjhEszWcoLL8pSZ3Ew9Bh5lhch3nu2ptwIKg9nb
 TORC3mADJ8LuVbk8g+n+M29IwnJh8QmWMqvln+mxjjP2Zofq+7NtmAJh5T2pOLxK7lZP
 u5FpETOBOxdX5KaPVy4sSp/Omaf4z/PSfd8DwIw8qlujwuDU7Clbp4q26ptj0yfYb6EP
 qt0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCivOsy5fmtnmsrBuj+R63gHuORVvBYIJWd1TsGMXEH7EYuDntmgoMpX4BOPkSfpdQ/nZFawscWUgKd+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA9Bid7zxr9dQq3Ywprnu5AxuHRemkXMgHXYJexGK5Hl2gIFc0
 FsO0o4rM7re4ZI9Kx4XlC5932+ecDfL32hS1MEGt0jH5JAWyFyTo3QglI20/hyE=
X-Gm-Gg: ASbGncuc9P/LGLam76AaY402qZSXKJWwKByWXBr346f5XG5rnOnl5UL1wf5THlT2ShX
 +1zbu1mB+C0QJ4JYAvXaKDE/pa0/+U/UB7GjpW2BXZ72wZiu6UgnlJVOWHMoul6VThAt3bzdaTP
 FsD2fXdBnoJV9SRO+nVdFbsQXdNprBWtYvjK0bhkZrYl3mOHCp8VZVc1uT8yblc3ecrIRkj0pc2
 3W0jVjKaALE2kSKgSYfrKa7Pf+w5+1DX8crjmlXkiWlSZjhmCReciJmYzV2p67ah+kvrYPmLeg1
 w9vIB031fWTtZtJJluY6BKUQwon4rNLT703BUXW9AWw57W0AmA==
X-Google-Smtp-Source: AGHT+IEny668UimPZ3R6dx4axvviTs297S1IJ5VK/kkx2SxfpDGI4c5Rl/7By42IdqNYV74cMm4sFA==
X-Received: by 2002:a17:907:980e:b0:ab7:b250:aaa with SMTP id
 a640c23a62f3a-abf2682f996mr1554838466b.54.1740986050266; 
 Sun, 02 Mar 2025 23:14:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac1dd6fd870sm60633966b.70.2025.03.02.23.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 23:14:09 -0800 (PST)
Date: Mon, 3 Mar 2025 10:14:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Delete a variable initialisation
 before a null pointer check in two functions
Message-ID: <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6g794bwbzG1Vv
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741708144.02485@t/w/ZCYKd+feyccCKKQV4g
X-ITU-MailScanner-SpamCheck: not spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

On Mon, Mar 03, 2025 at 01:01:40AM +0200, Dmitry Baryshkov wrote:
> On Sun, Mar 02, 2025 at 09:56:00PM +0100, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 11 Apr 2023 18:24:24 +0200
> >=20
> > The address of a data structure member was determined before
> > a corresponding null pointer check in the implementation of
> > the functions =E2=80=9Cdpu_hw_pp_enable_te=E2=80=9D and =E2=80=9Cdpu_=
hw_pp_get_vsync_info=E2=80=9D.
> >=20
> > Thus avoid the risk for undefined behaviour by removing extra
> > initialisations for the variable =E2=80=9Cc=E2=80=9D (also because it=
 was already
> > reassigned with the same value behind this pointer check).

There is no undefined behavior here.

> >=20
> > This issue was detected by using the Coccinelle software.
>=20
> Please don't send resends and/or new iterations in response to your
> previous patchsets. Otherwise they have a pretty high chance to be
> ignored by the maintainers. Use a fresh git-send-email command to send
> new patchset.
>=20
> >=20
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

Remove the Fixes tag.  This patch is fine as a clean up.

> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

regards,
dan carpenter


