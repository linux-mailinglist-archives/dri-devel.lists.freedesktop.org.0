Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC3E17A0E0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2463C6EB7E;
	Thu,  5 Mar 2020 08:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3C86EB41
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 16:43:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 024GbPrD011137; Wed, 4 Mar 2020 17:42:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=+w7TBSBgLDE2Teg6+clwcWdskIiO4YFIp83k3XHalzc=;
 b=M6kTjYLRpGwuY4eT7pAtP/3D4n3l83K2qdFKS2zfrodHMgY8b6nppTd1iO0lnCrWhuVD
 cTxjnoti+kDLCYr8aXQV1ee+d2oBmaDjIWCyFYnK0yK2XW3v0IkjNK1/j5ZYD9ZiUkrZ
 CR98qAZtHUG+vdNZ7Rk78PFBIX1z9P9DhazCHR0ZQwG6Xxw05hCiQgf7vNj/OngCg16D
 kDAckweJyAlGC5X6ylxn4+MDFQFHlyLzaPy1XPwLv4mY5isPtQacYQxwppH/KhE0Ubkd
 pJ3xW6fnBkgNYUSRQ0eBzUlTwmTA8jS4jvSwksPtBaHK+KgH/qJ1ULIBaEBkH38hIGKy sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfdyd2ss4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 17:42:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1460E10003A;
 Wed,  4 Mar 2020 17:42:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4CD82C2510;
 Wed,  4 Mar 2020 17:42:10 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 4 Mar
 2020 17:42:10 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 4 Mar 2020 17:42:09 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] gpu: drm: context: Clean up documentation
Thread-Topic: [PATCH] gpu: drm: context: Clean up documentation
Thread-Index: AQHV2Bfdg2vUklVZ90OGQMC6Ot+gVag4vS2AgAAJkYA=
Date: Wed, 4 Mar 2020 16:42:09 +0000
Message-ID: <f8af37a1-ff6b-9a09-7b24-a7e3f9a981c2@st.com>
References: <20200131092147.32063-1-benjamin.gaignard@st.com>
 <CACvgo50=Wt9LFWDjkJa99T8r8A64JWgfqApmir8kX=kSXd1yog@mail.gmail.com>
In-Reply-To: <CACvgo50=Wt9LFWDjkJa99T8r8A64JWgfqApmir8kX=kSXd1yog@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <C058D96537F8D2408B63FD25D7D3F3A5@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_06:2020-03-04,
 2020-03-04 signatures=0
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
Cc: Dave Airlie <airlied@linux.ie>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/4/20 5:07 PM, Emil Velikov wrote:
> On Mon, 3 Feb 2020 at 08:11, Benjamin Gaignard <benjamin.gaignard@st.com> wrote:
>> Fix kernel doc comments to avoid warnings when compiling with W=1.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>> ---
>>   drivers/gpu/drm/drm_context.c | 145 ++++++++++++++++++------------------------
>>   1 file changed, 61 insertions(+), 84 deletions(-)
>>
> Since we're talking about legacy, aka user mode-setting code, I think
> a wiser solution is to simply remove the documentation. It is _not_
> something we should encourage people to read, let alone use.
>
> Nit: prefix should be "drm:"
Should I assume it is the same for drm_vm.c and drm_bufs.c ?

Benjamin
> -Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
