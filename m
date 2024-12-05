Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABDC9E687F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 09:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D833710E608;
	Fri,  6 Dec 2024 08:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="IN6sqLn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-tydg10021701.me.com (pv50p00im-tydg10021701.me.com
 [17.58.6.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001CB10EE51
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 13:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1733404763;
 bh=DeIIq7By5hb3j6D6u79xafAimRNm6W+G83In10fjfT4=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
 x-icloud-hme;
 b=IN6sqLn/x5OCaqJO4vF5gn/fcjmZc3fZlyeytDMJnKp7XQ3de7PoFnmqSe0zeC9a5
 vUwI0Tptt7E+4Q3DWUqdgUpD0xOI9lBpQ4RQvwZlnJGvBh2ctgzycf7q159ExifH7K
 a8AIRvkTNSgebMbC7lLYAk5B4kjmGYrIRQclMfECHJrJ1+KGG+jAbVUk+xSHPoDbnh
 1e9j8QEBXLJX5ZxwWzRD/5Q41qX+s8eZZmLJoAKcnBcHGPNxbbfWDhHq6Q/v1949Vm
 rVciEGx0K4GT+eFIHW+pi7hnAXPVyGUzlxkEJ6XEG1lJhoSlPxkPp1AOo8we43GZSE
 xVpU9Q2Rr6i5g==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-tydg10021701.me.com (Postfix) with ESMTPSA id C58AC3A1052;
 Thu,  5 Dec 2024 13:19:06 +0000 (UTC)
Message-ID: <f150fd45-7f84-4036-aa0e-32bd04fbeb67@icloud.com>
Date: Thu, 5 Dec 2024 21:19:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 quic_zijuhu <quic_zijuhu@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
 <7ugfaj2h3sy77jpaadco5xtjalnten3gmvozowcle3g7zcdqs4@sqf5l47onbsi>
 <ac42e652-4128-44ea-976e-5234360d8183@quicinc.com>
 <eyu7nm5hvwfqxgysnrzsvianzf7abvlovpxfo7snsxowmuuhpj@tah3gkqm5ldj>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <eyu7nm5hvwfqxgysnrzsvianzf7abvlovpxfo7snsxowmuuhpj@tah3gkqm5ldj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2qHgOEYCHFJo6csSrQf0NeEl1TvG8_uZ
X-Proofpoint-ORIG-GUID: 2qHgOEYCHFJo6csSrQf0NeEl1TvG8_uZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_11,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=736
 spamscore=0
 phishscore=0 clxscore=1011 suspectscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412050096
X-Mailman-Approved-At: Fri, 06 Dec 2024 08:12:04 +0000
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

On 2024/12/5 18:37, Uwe Kleine-König wrote:
> On Thu, Dec 05, 2024 at 04:37:08PM +0800, quic_zijuhu wrote:
>> On 12/5/2024 4:10 PM, Uwe Kleine-König wrote:
>>> On Thu, Dec 05, 2024 at 08:10:17AM +0800, Zijun Hu wrote:
>>>> From: Zijun Hu <quic_zijuhu@quicinc.com>
>>>>
>>>> gpio_sim_dev_match_fwnode() is a simple wrapper of device_match_fwnode()
>>>> Remvoe the unnecessary wrapper.
> 
> Just spotted: s/Remvoe/Remove/
> 

this typo error is my mistake, will correct it.

>>>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
>>>> ---
>>>>  drivers/gpio/gpio-sim.c | 7 +------
>>>
>>> I think if you move this patch before patch #4 in your series, you only
>>> have to touch this file once.
>>
>> the precondition of this change is patch #4, it will have building error
>> if moving it before #4.
>>
>> actually, we can only do simplifications with benefits brought by #4.
> 
> Ah I see. I thought that device_match_fwnode only got the const for the
> 2nd parameter in patch #4.
> 
> Best regards
> Uwe

