Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C272F9497D5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 20:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE42810E079;
	Tue,  6 Aug 2024 18:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="lqGPTPBg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F5A10E028
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 18:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1722970614; x=1723575414; i=markus.elfring@web.de;
 bh=QsEz/njIOEwlQJd+1jweVyiPy2SWvIy81sbU5T8pWvA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lqGPTPBgN8OeUaEeEUOtgSXcziEGan2ywLqShFZwSVnyBr+A1YaPsoe7ZgTOT0pY
 PrxeVMPz8Ee8FHwoU3Jh+t+LooR7LYZfAlkCXtAtMWCLGzDihbDbMP0NGQUILHvpQ
 i7TwtZcoZCsFtbzgLL2qwiUjZT3Rf0oSg2C37hdTnE4bps64JfhCBRxOyyXBv8ugp
 iavT+ZXk+fnzrSPQWV0AB86VKRq1RRTeyDlcrBeVic1qQeTFDBcgu+QBI9/Ta7FiK
 4L0QZaSty3CiQH1uTIqn60I5JZxG1YOhxSIdi4i7dsCp+oHUv4nyQUsjNNESxnAEF
 hQ1l0o5gJXCD+Zrhbg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnG2Q-1rucLq0K5U-00l11C; Tue, 06
 Aug 2024 20:56:54 +0200
Message-ID: <de748b0f-6e05-4c36-a6ad-cc5b09718e0b@web.de>
Date: Tue, 6 Aug 2024 20:56:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 00/10] AMD XDNA driver
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, George Yang <George.Yang@amd.com>,
 king.tam@amd.com, Max Zhen <max.zhen@amd.com>, Min Ma <min.ma@amd.com>,
 Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
 Sonal Santan <sonal.santan@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <f66e2016-d2c8-4a86-9a6f-267770f7fed5@web.de>
 <23f5f0ea-305c-15c0-4578-ef1307621d07@amd.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <23f5f0ea-305c-15c0-4578-ef1307621d07@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:J6XKjukaDhMuC6VH8csRFL8lT4765mGsvAbvwWw3KvpbqeZrG9K
 OPHyPJkXwKYZ5wh6Pq7GStAcNjj60V85x2I5Qngcew/gQeuf/jdaEx9KRc7Z4a40PCoc+rO
 t1VAMGkYxbUH//97kTli4ZXTCJi/mIPpenNF44cR5u7Lbd41f90ZL6TFB3zHcZrpZjlaWw6
 iXme0jLWYwpxZrwuQImgQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Cnd4g9rne+o=;F1I9lZDQNZ4ZXNXFHGo+KLJRTz9
 PETRrhfTsFwRxjI8CqJgh6rFg2VTVStFXS+4d0KckQ2jowmfqEKiEdKstZyMC2gOWK/12YjNe
 WnoehIBjYU1dA3++EfgiQUtF3DDG6GpsmzFMyIJJYEtpVEqyXyWTHrLh84rcxe+7I5r/zuzSH
 uWcm+vk9GI+4mLw76PhHD6JMGXHk6F+BRXM2XxFiRv2s/AeDk2ZwrjMVEeXtwdDYrY5i/Zsgl
 dnCuC6q2rsmdQtd6LfxgC18tUCG2M9eckGZkbdIxHO50LukP3/4wH8N1TZ3yNqueuBiMlOiIj
 LF1dV3wkE/HVZW7k/PiMPYrGJkQs3rX/NFt2IWPkULRPFgAnx0xvBtETHlYxqONdV63XzD408
 zJCc0lfTYfYojHwYU+XB9Irx4O4dhyV9/UoG20mkKrkgcKGbbO+ER3Bf+ElT6s+ZsevFw/Yqn
 zCKF7kRvRW8GCWhZupd706ragYUcbShdqBL43BfqSLNuZ4ZqtA0rugCeaLV1hVxYqe9Pc3Ong
 nMKkKvDn1ss/7VwahSBH+0wUChUr+R64eSWl2P4ES7HaWB97cIGjcs0HgQvdc3/XpdbCEnRnj
 LNLU9MINRuL2EShRKzi7wfpFtE+rfrckNRoJKFWRe/tJ8ydIwPvHrjVQ8gr1jXVbfEk+KQWo7
 SRKZyDdIfvWGQsj7x6o3HprfHcQWZg9uDM7AFr2sL1f+ir3MZbhaZc+3NoTfYjcwBMwDYybIa
 IT9O9CoWWhWKwASDP+cPxf5a7x/IYecVy8TOJilYf5By0uA33BUTtCFClzZl/+Evg+1a3pIgT
 sTjxTXUimByzo2mg628gigZg==
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

>> https://lkml.org/lkml/2024/7/19/803
>> https://lore.kernel.org/linux-kernel/010a46ba-9dc4-e3e3-7894-b28b312c6a=
b1@amd.com/
>> [01/10] accel/amdxdna: Add a new driver for AMD AI Engine
>> =E2=80=9Cguard looks cleaner. We will use it.=E2=80=9D
> We reconsidered this request

Interesting =E2=80=A6


> and searched accel and drm subsystem. I did not see it was used.

Do you notice how applications of scope-based resource management are grow=
ing
in other subsystem areas?


> This does not look like a required change for upstream at this moment.

Maybe.


> We would keep the current code for this patch series.

Will further collateral evolution become more attractive anyhow?

Regards,
Markus
