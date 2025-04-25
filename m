Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90EDA9C85C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 13:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A0010E011;
	Fri, 25 Apr 2025 11:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="Lh35U0+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2181 seconds by postgrey-1.36 at gabe;
 Fri, 25 Apr 2025 11:57:48 UTC
Received: from outbound.pv.icloud.com
 (p-west1-cluster4-host6-snip4-6.eps.apple.com [57.103.65.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9290D10E011
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; bh=WTzGg3KDeNWnZ7BGsdPuQxd44aiGvH+K5sJokIuJ8r0=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
 b=Lh35U0+amnwHTl0AEcvp49zrAHy2hWbRluciOb8G3Os84LDhiwrOPSN62n+PMPFBW
 awgj7U6jlLWheCfluhxAoXOg010cm5QFDTwehVYoD9rdh7Vaw1vmAlRSkqkUmTehUC
 0Wj0uaww+b/yZmSj94q/eMWeC9cSi/p1aPG6CWhHoD/J9EJ+y25mA0nd23KgTrCtQy
 6WMUkLvvAdXRpi2rWn3hbuFfcvE+UdIjeb2sLTe3F2l/wu6fKcf41kw1Ay8LoafiE9
 5u9uVnE6pR6Izh/MUUbbTRDr3D1nd02o/VBGMcxp21vTGZ1udEBEQNUYDLVomNi8/P
 uIcGCg7umDP1w==
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
 by outbound.pv.icloud.com (Postfix) with ESMTPSA id 2D70818000A5;
 Fri, 25 Apr 2025 11:21:19 +0000 (UTC)
Message-ID: <6621335c-b099-43f3-8c4e-eff7dfec57ac@icloud.com>
Date: Fri, 25 Apr 2025 19:21:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/nvidiafb: Correct const string length in
 nvidiafb_setup()
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Antonino Daplas <adaplas@gmail.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
References: <20250407-fix_nvidia-v1-1-843f8d031c7d@quicinc.com>
 <87o6wky613.fsf@intel.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <87o6wky613.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fs3s1X-d5AZMGskkSyGQsTMDJro4jJx1
X-Proofpoint-ORIG-GUID: Fs3s1X-d5AZMGskkSyGQsTMDJro4jJx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=708 phishscore=0
 adultscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2503100000 definitions=main-2504250082
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

On 2025/4/25 16:55, Jani Nikula wrote:
>>  		} else if (!strncmp(this_opt, "noscale", 7)) {
>>  			noscale = 1;
> A further cleanup could be to replace all of the strncmp's with
> str_has_prefix(this_opt, "...") to avoid this class of errors
> altogether. It also returns the length of the prefix on match, and that
> can be used to drop more magic numbers.

very agree with your point. may use strstarts().

there are many strncmp() usages with long const string and hardcoded
string length. some usages are wrong.



