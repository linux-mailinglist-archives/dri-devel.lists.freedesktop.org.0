Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D91B0E262
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 19:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810E510E6DF;
	Tue, 22 Jul 2025 17:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.b="nLYtFGj+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 433 seconds by postgrey-1.36 at gabe;
 Tue, 22 Jul 2025 17:06:48 UTC
Received: from terminus.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA8310E318;
 Tue, 22 Jul 2025 17:06:48 +0000 (UTC)
Received: from [127.0.0.1] (c-76-133-66-138.hsd1.ca.comcast.net
 [76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 56MGwnFd657671
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 22 Jul 2025 09:58:49 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 56MGwnFd657671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2025062101; t=1753203533;
 bh=zcW3ufrPeS9z5vjFN56GirhJJTbdaCIUAEbrqpAovKM=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=nLYtFGj+YjoGNEYGiQTtSSrpLjsViKYD5wc5TuPqddAJ8ED6zjoIGvwZgXShXXwZt
 Z82UlljOtC8H/vyP3+1XHhLAhJvsSdBXSHJ84a1lkAM+dC0eOenHEapfk4l+xPw3Yp
 Tt3Lpn5k1a8EeQHBGdtankMXR8c2x9H6h+0GL1KdQYwwtXGBVhacT1Ab7+XMA9Vwvr
 jaS1KWf/6v6gMYlrDFaRXV8sXwAbLXlPwERIbq3nL8fW2l05WOB61yjvWDeSWsbJtw
 LjgcnAROyJDyAmDWXrktO4r2jj7OpE+JXGo7pOG10BKOA/G6IDssVi679Ct4qgRD8y
 fQKKcG4D5VH1Q==
Date: Tue, 22 Jul 2025 09:58:48 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Greg KH <gregkh@linuxfoundation.org>, WangYuli <wangyuli@uniontech.com>
CC: airlied@gmail.com, akpm@linux-foundation.org, alison.schofield@intel.com, 
 andrew+netdev@lunn.ch, andriy.shevchenko@linux.intel.com,
 arend.vanspriel@broadcom.com, bp@alien8.de,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 colin.i.king@gmail.com, cvam0000@gmail.com, dan.j.williams@intel.com,
 dave.hansen@linux.intel.com, dave.jiang@intel.com, dave@stgolabs.net,
 davem@davemloft.net, dri-devel@lists.freedesktop.org,
 edumazet@google.com, guanwentao@uniontech.com,
 ilpo.jarvinen@linux.intel.com, intel-xe@lists.freedesktop.org,
 ira.weiny@intel.com, j@jannau.net, jeff.johnson@oss.qualcomm.com,
 jgross@suse.com, jirislaby@kernel.org, johannes.berg@intel.com,
 jonathan.cameron@huawei.com, kuba@kernel.org, kvalo@kernel.org,
 kvm@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux@treblig.org,
 lucas.demarchi@intel.com, marcin.s.wojtas@gmail.com,
 ming.li@zohomail.com, mingo@kernel.org, mingo@redhat.com,
 netdev@vger.kernel.org, niecheng1@uniontech.com,
 oleksandr_tyshchenko@epam.com, pabeni@redhat.com, pbonzini@redhat.com,
 quic_ramess@quicinc.com, ragazenta@gmail.com, rodrigo.vivi@intel.com,
 seanjc@google.com, shenlichuan@vivo.com, simona@ffwll.ch,
 sstabellini@kernel.org, tglx@linutronix.de,
 thomas.hellstrom@linux.intel.com, vishal.l.verma@intel.com,
 x86@kernel.org, xen-devel@lists.xenproject.org, yujiaoliang@vivo.com,
 zhanjun@uniontech.com
Subject: Re: [PATCH v2 6/8] serial: 8250_dw: Fix typo "notifer"
User-Agent: K-9 Mail for Android
In-Reply-To: <2025072252-halves-sadness-18dc@gregkh>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
 <2BF1749F02ADE664+20250715134407.540483-6-wangyuli@uniontech.com>
 <2025071607-outbid-heat-b0ba@gregkh>
 <634BA467821D37FE+0b2ace38-07d9-4500-8bb7-5a4fa65c4b9f@uniontech.com>
 <2025072252-halves-sadness-18dc@gregkh>
Message-ID: <10127165-7020-4D35-B0F3-099F58B2AF4E@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On July 22, 2025 12:57:33 AM PDT, Greg KH <gregkh@linuxfoundation=2Eorg> wr=
ote:
>On Tue, Jul 22, 2025 at 03:22:18PM +0800, WangYuli wrote:
>> Hi greg k-h,
>>=20
>> On 2025/7/16 16:08, Greg KH wrote:
>> > > Signed-off-by: WangYuli <wangyuli@uniontech=2Ecom>
>> > Is your name all one word like that, or should there be a " " between
>> > them?
>>=20
>> If I were to follow Western naming conventions, my name would be writte=
n as
>> 'Yuli Wang'=2E
>>=20
>> However, frankly, I find it unnecessary and can't be bothered to follow
>> their customs, unless a maintainer strongly insists=2E (For example, yo=
u can
>> see that my signature on commits for the LoongArch subsystem is differe=
nt
>> from my other contributions)=2E
>>=20
>> Since Chinese names are written without any spaces in Chinese character=
s, I
>> don't think it matters=2E
>
>Then use your Chinese name, don't feel like you need to change it to any
>other naming convention=2E  There's no requirement here at all to do so=
=2E
>
>thanks,
>
>greg k-h

To put it differently: what Greg (and the rest of us) want to make sure is=
 that your name appears the way you prefer=2E=20

Having the Latin transliteration in whatever form you prefer is greatly ap=
preciated, of course, since the knowledge of Chinese script is limited outs=
ide East Asia, but that's just about it=2E

If you want to add your name in proper Chinese script in addition that sho=
uld be fine, too=2E
