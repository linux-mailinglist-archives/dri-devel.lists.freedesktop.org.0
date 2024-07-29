Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB1A93FFEF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 22:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618BD10E48A;
	Mon, 29 Jul 2024 20:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="rEXdwxOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp41.i.mail.ru (smtp41.i.mail.ru [95.163.41.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9E610E489;
 Mon, 29 Jul 2024 20:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To
 :Cc:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=WstChANbA7SvfR+Aj+VLGTVexV2GfobSXd8n+qdUMk4=; t=1722286670; x=1722376670; 
 b=rEXdwxOM1IBbn8Iuu+IDo+rdbHPRqUZakGAuISb4+be03OO+A7uYMjZ/eQXwJFrrMIwO0JObXUU
 mEA7CaUDEI+AqmB7Esk8B6Sx3rWxIR0Ko0Mbw1Verrp8UKiZyNEcGKbZCe3EPFwk6YcHF4Q6TE5f3
 fAR0uO5x0VnEczWEZhc=;
Received: by exim-smtp-868bf69f6c-jz7wc with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1sYXRC-00000000Lgt-42wv; Mon, 29 Jul 2024 23:57:47 +0300
Message-ID: <2e70738e-24b9-4660-b094-4ac055bd5fa1@jiaxyga.com>
Date: Mon, 29 Jul 2024 23:57:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drivers: drm/msm/a6xx_catalog: Add A642L speedbin
 (0x81)
To: Bjorn Andersson <andersson@kernel.org>
Cc: konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robdclark@gmail.com, sean@poorly.run,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 fekz115@gmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 cros-qcom-dts-watchers@chromium.org, danila@jiaxyga.com
References: <20240722184314.36510-1-danila@jiaxyga.com>
 <20240722184314.36510-2-danila@jiaxyga.com>
 <4v5kl65wurifvkpious5ae4zhpv7zklejalg4sp4vcjiwhfbv2@o7jee7jil5ke>
Content-Language: en-US
From: Danila Tikhonov <danila@jiaxyga.com>
In-Reply-To: <4v5kl65wurifvkpious5ae4zhpv7zklejalg4sp4vcjiwhfbv2@o7jee7jil5ke>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: exim-smtp-868bf69f6c-jz7wc;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9000B6812E77BE1C6854AF46E97D2152892C6A59DA105ADB3182A05F53808504060C4600FFE09C8F53DE06ABAFEAF67052AA636E252999B2E1A9F61335A0CD567A938C1B4F21A4609
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D3E352D4AD7EBF54EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375AC38C7EC4509C8B8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89D4A26D28DE3AF79F31B418E4BCB5C522F823D4E39098394CC7F00164DA146DAFE8445B8C89999728AA50765F7900637F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006375FFD5C25497261569FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE73E9A205C6FEB9DE5D32BA5DBAC0009BE395957E7521B51C2330BD67F2E7D9AF1090A508E0FED6299176DF2183F8FC7C05BA2E4CC9113A626CD04E86FAF290E2DB606B96278B59C421DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B60E26A56DB46E81E4089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A524FB376BB7EE73F85002B1117B3ED696C6F54A22AD937764CA7E60A991436CA2823CB91A9FED034534781492E4B8EEAD97DCCBFEAAA0BC6ABDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D349A949488F6BF46DDA8A79E8062A6CA7174963014F8FF3F0AF81E76E12A14E3B5475EFE7A0B9C313D1D7E09C32AA3244C638414D35EF316DE77DD89D51EBB774228BAEE884F4A908DEA455F16B58544A2E6014D08E9BF26855DA084F8E80FEBD322CFFF16B4474ECB4573B60270F1EB7C214C2BC1176D5C25
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6V1hbAjFQeYHQ==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C739498119976140086885851F93A76BF6F7B0A637FD5CEC06DF74311457E6F54EDCE5FF2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
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

On 7/29/24 06:09, Bjorn Andersson wrote:
> On Mon, Jul 22, 2024 at 09:43:13PM GMT, Danila Tikhonov wrote:
>> From: Eugene Lepshy <fekz115@gmail.com>
>>
> Please make sure the subject prefix matches other changes in the same
> driver/files.
>
> Regards,
> Bjorn
>

Thanks for the advice

"drm/msm/a6xx: --//--" will be better?

Best wishes,
Danila
