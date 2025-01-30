Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E197A22C1A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 12:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7212110E926;
	Thu, 30 Jan 2025 11:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="EbrlbQSA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C2110E926
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1738234870; x=1738839670; i=markus.elfring@web.de;
 bh=+t4JrvrPiLsj7bfb840h38pFA44a5hm5mtWmRSYdCpU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=EbrlbQSAj+f38PA8703tTZaMiR4ayuD9Qrvyd9QGYqJH7YthbOq//pBZda9lk8L/
 8Z/bzqm9AcXAMhwbS7RdUkARLZ8bEvd0EdUhD+FRE9AbkWXJxoHLcoT2yUZDnoAru
 AEpVtrhhTX6gwbMUeKZ3owYdgRazmCSF+8S1sKEY3QoZ9646CKqHg5lS86sDrdRD4
 GAbkiHBdMvF1FSVgBio0MksJCA2Iu2Q6DHWn+Yg3/3vqeK/pNqvYcFMKTRC3o8uWh
 KgSWCXjJhP+JBxslKqGd0a2lz6i0DAbUIk83mJ6VEQvNIYUmrFpRTTuGrXGp53KWW
 cqA7/eN/08snJD7Q9w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.40]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MIya8-1tsDzY10Di-00Lbns; Thu, 30
 Jan 2025 12:01:10 +0100
Message-ID: <e06cb7f5-7aa3-464c-a8a1-2c7b9b6a29eb@web.de>
Date: Thu, 30 Jan 2025 12:01:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cocci@inria.fr, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-xfs@vger.kernel.org, ceph-devel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ibm-acpi-devel@lists.sourceforge.net, imx@lists.linux.dev,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Carlos Maiolino <cem@kernel.org>,
 Chris Mason <clm@fb.com>, Christoph Hellwig <hch@lst.de>,
 Damien Le Moal <dlemoal@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 David Sterba <dsterba@suse.com>, Dick Kennedy <dick.kennedy@broadcom.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 Easwar Hariharan <eahariha@linux.microsoft.com>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 James Smart <james.smart@broadcom.com>, Jaroslav Kysela <perex@perex.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
 Josef Bacik <josef@toxicpanda.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ilya Dryomov <idryomov@gmail.com>,
 Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>,
 Keith Busch <kbusch@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nicolas Palix <nicolas.palix@imag.fr>, Niklas Cassel <cassel@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Ricardo Ribalda <ribalda@google.com>,
 Sagi Grimberg <sagi@grimberg.me>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>,
 Selvin Xavier <selvin.xavier@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Victor Gambier <victor.gambier@inria.fr>, Xiubo Li <xiubli@redhat.com>,
 Yaron Avizrat <yaron.avizrat@intel.com>
References: <20250128-converge-secs-to-jiffies-part-two-v1-1-9a6ecf0b2308@linux.microsoft.com>
Subject: Re: [PATCH 01/16] coccinelle: misc: secs_to_jiffies: Patch
 expressions too
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250128-converge-secs-to-jiffies-part-two-v1-1-9a6ecf0b2308@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:MEBO0GsSQ1SMY/zsPX1U6svBkJN6BjoZlGAGaEjdoAIc7rC0MTJ
 jMCDSnzW+JUiBx0jWaw4axa0ASi7RKu+znCfMa+5DA/GZz89brkDkAWXkPNY1Ii+WKoCg2M
 6p6JIXEbQugmQdBp3V5wVA0hm/aJde6kKUDnCeJpidqtVh0kGmNtl+sNaqnuL+ZhzFG6g5Z
 yt9wjcSDL8KRKPEOFFBUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PCsLlrQ8lfw=;SoOTgoPi1u3ddphFfFnJ4K80Ey1
 LhQV5NN3S1upZ+kQWRf5X13xSqfZszqJAWQG1OpVuCmo6tpVtGTWgh7ad8U9WwKa6cxbghVrt
 NekQpjR/Dsev5s67AnEX8ThdDcbbfKvRw5T8fgaGslTYv3XceDxH2g+ZINh1g5Zl1a5Kb7tUy
 iHsXRJsmGMh72moAwMl2T0JX0Ldu9mm36L7zjNeIOX0Xh1EcbDwPTnBvWT5Jmf/TZjjTD915z
 wkMwvyKEhqv+ILIT2NmQNRENiOP1N2A5cNBwL7S6RvzS4B2b6TETCM6HSXEgzk4eBq/cjFYJ7
 Ta/beBAeX/x1vlhieJ7zCgVJ/DjpXSnLIakxsKLFsTqznw+ifPF4fJli2HnMVo9sGRnRMWTrl
 qkRACaZwBVl2ReKWA6Ylw6VqlTKMT2hF2oCiSA6SNHSwnqWCdtkKT3MwrASEpsgRd1t3m2qrg
 dzBxkwY3Iqvyla51ZhZ4KeRRsMYftkVOD06V/LWAUsGh3adVyfNfo1rFkiXbs8oaQXw9Ja6tZ
 RzPDki+nrGeKxCzQaenUyiA48SLrGJ61YEiLCyUiil3FCYQCPBx6oGNf2hTXlPwkPSrMnvfyk
 yvQjlFy7DS+9l6YMcPoT4oJhRV5HGFbKwznZ3oL4+T60BN/ekmSzbtefb+GOhIG+4+ywk54uP
 mTXT8J21gH5qaPIaPiannqZ/nmjWeakTcPkk/rVwdP3tmwDxSgnRKkzPj2UadACH+VKlM8JrQ
 lfxiv25g7Br2uvZqXG/3Mkq5j8BPnzef0ZEvV00FZ4lN2l35qROKiS4KNw+Oa2MExwmkZF8N0
 Me4UosI1FbMOonU2tpnvT5R9FbJv2h1tIMF/XYUdA7G6V3mY01f2O3g0W60Gd1Z/onfWiWTsC
 vsuTuJ7TZfE6AwrUs1WQ/Wi8E1So2MZdkmeUagRZY0DoLytG1bmL84SvJIdb8h4sdAVK3EONn
 3chVYtWWI+cM+cz3Whj1giWzBTzyQOpKjx+HZcaRA80KQWJ5iUExiJkz11n/ptAWXabZtwVr1
 IIfHoUKeT2WT8pACVlj4x3gvqIClbPKbcGWhs4epE3uD2mR9gqFM8fCUfkHNngYTCZq6z5Did
 d50IILddgQEvH7rjWs9K2n3wFTct4+ajCi45dnopg2wTz/Oma2Lt3tO8Qenl6l70EogpyLyCN
 iMoxPpi5Wclpw/Kc+5YCXrWUIzzUatEenh+mkeiB0/g==
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

> Teach the script to suggest conversions for timeout patterns where the
> arguments to msecs_to_jiffies() are expressions as well.

Does anything hinder to benefit any more from a source code analysis approach
(like the following by the extended means of the semantic patch language)?


// SPDX-License-Identifier: GPL-2.0
/// Simplify statements by using a known wrapper macro.
/// Replace selected msecs_to_jiffies() calls by secs_to_jiffies().
//
// Keywords: wrapper macro conversion secs seconds jiffies
// Confidence: High
// Options: --no-includes --include-headers

virtual context, patch, report, org

@depends on context@
expression e;
@@
*msecs_to_jiffies
 (
(e * 1000
|e * MSEC_PER_SEC
)
 )

@depends on patch@
expression e;
@@
-msecs_to_jiffies
+secs_to_jiffies
 (
(
-e * 1000
|
-e * MSEC_PER_SEC
)
+e
 )

@x depends on org || report@
expression e;
position p;
@@
 msecs_to_jiffies@p
 (
(e * 1000
|e * MSEC_PER_SEC
)
 )

@script:python depends on org@
p << x.p;
@@
coccilib.org.print_todo(p[0], "WARNING: opportunity for secs_to_jiffies()")

@script:python depends on report@
p << x.p;
@@
coccilib.report.print_report(p[0], "WARNING: opportunity for secs_to_jiffies()")


Regards,
Markus
