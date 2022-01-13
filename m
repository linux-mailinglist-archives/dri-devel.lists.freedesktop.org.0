Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 914E448D8A7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 14:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015D21122DF;
	Thu, 13 Jan 2022 13:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7679F1122DF;
 Thu, 13 Jan 2022 13:17:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20D8S0ZJ016882;
 Thu, 13 Jan 2022 14:17:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=vWWHFsuh46D5SfaO0k2X8hLjowrmWXVkxsmKvyUtw8U=;
 b=hX0hu6/JJ425axfDUuOLyU5Q2bDitArl2sA2zP3byEiWLNAuAGFdRudKDa3iSapIWLYb
 b4OREpi6MyUZDlONmJYlwHbMZ6ICffVepyGiaZaH4owWq+7BeFv3aMC1FDPvKwOm7/NE
 kFkV/J7IiaQvH6o17y47gYgbgnqZeba8Vns41Eu6Oyx/UuvPWlCKONNJlpxJlZQT6+QE
 nPZSEFipCOM3dvOx9r+1ywGjLkcyIoX7qqjhad0UqkYkuqn/aLyN5k352eREvP7CVNZ5
 L72ek77bk+iQEUZpWpJx46+JC++VIioplW0hLTxjV7uUbMLhq78Byk7oASPRvrtmEY/L kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3djgkksh8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 14:17:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9CBCA10002A;
 Thu, 13 Jan 2022 14:17:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A87220D186;
 Thu, 13 Jan 2022 14:17:05 +0100 (CET)
Received: from lmecxl0993.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 13 Jan
 2022 14:17:03 +0100
Subject: Re: [PATCH v3 2/6] drm/plane: Fix typo in format_mod_supported
 documentation
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, Simon Ser
 <contact@emersion.fr>
References: <20211226112503.31771-1-jose.exposito89@gmail.com>
 <20211226112503.31771-3-jose.exposito89@gmail.com>
 <3DdB6YPUQr4O063yNreefZcIm6p5Z6HORoVVbk5RTMmjz8qvnxMse42hLvfDmA323KG-TWLc_JUFZEEEIkoINXQuAzjLVe2jRRM01tQgYOU=@emersion.fr>
 <20220107172601.GA122757@elementary>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <735432ff-d9a7-aff0-e94a-13035e944570@foss.st.com>
Date: Thu, 13 Jan 2022 14:16:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107172601.GA122757@elementary>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_04,2022-01-13_01,2021-12-02_01
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
Cc: airlied@linux.ie, alexandre.torgue@foss.st.com,
 benjamin.gaignard@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 marex@denx.de, linux-imx@nxp.com, intel-gfx@lists.freedesktop.org,
 s.hauer@pengutronix.de, rodrigo.vivi@intel.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, dmitry.baryshkov@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/7/22 6:26 PM, José Expósito wrote:
> Hi Simon,
> 
> On Wed, Jan 05, 2022 at 11:54:43PM +0000, Simon Ser wrote:
>> Pushed patches 1 & 2 to drm-misc-next. Thanks for your contribution!
> 
> Thanks a lot for the review and for applying the changes, appreciate it.
> 
> Is there something that needs to improve in the other 4 patches?
> Or just waiting on maintainers input?
> 
> Thanks,
> José Expósito
> 

Hi José,
for the drm/stm part,
Applied on drm-misc-next.
Many thanks for your patches,
Philippe :-)
