Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F16527FCC38
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 02:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651AF10E0BA;
	Wed, 29 Nov 2023 01:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 01:13:18 UTC
Received: from omta034.useast.a.cloudfilter.net
 (omta034.useast.a.cloudfilter.net [44.202.169.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14A010E0BA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 01:13:18 +0000 (UTC)
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
 by cmsmtp with ESMTPS
 id 7bH3ryUSejtZ3891srk2Tf; Wed, 29 Nov 2023 01:06:16 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id 891lrBUcFAKSc891lrowWd; Wed, 29 Nov 2023 01:06:09 +0000
X-Authority-Analysis: v=2.4 cv=N6w6qkxB c=1 sm=1 tr=0 ts=65668e81
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=7m0pAUNwt3ppyxJkgzeoew==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10
 a=baS5nS6MRrMoxbYeFxYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C/YiKZxhNMFFaE6XGPApsU1lijWfxX0VGsY6O+BLkM4=; b=XJ5PlnrM6kR1l1gH+7qJlyyh2f
 a5JD20rrWDqIpkBIOWumTlDNMoYLtNdjgHAE5Gu7/Kb/OIVUpHWb2q4xFTEssZeyoUaD4SB+BS7VA
 qwFWyYvqJvXBDYSpotAsFnroDEO+iSHZOBZKfwy3lAetH3X7GOANiPTP/lX2pIog5JqkD/8HhiYLx
 ZralkC8fT5PFsGpbGQItMoJZhvElNhSHI6+n7JShHDwf2vFyfIm7j4NQ1+BIaBuHC/dkrj4Q2AEH4
 aAq6Cv+cyyxeJF/a/nicAkoRX3TKHOuSH4ivEGIKXBMdpJuGvQD4JA6nZVSClm4iHf1A5owPtqhlB
 KOkFPYMg==;
Received: from 187.184.156.122.cable.dyn.cableonline.com.mx
 ([187.184.156.122]:48879 helo=[192.168.0.9])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <gustavo@embeddedor.com>) id 1r891k-0028aN-1Q;
 Tue, 28 Nov 2023 19:06:08 -0600
Message-ID: <f0662715-928d-4685-8f88-f2129eddab3c@embeddedor.com>
Date: Tue, 28 Nov 2023 19:06:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Nouveau] [PATCH][next] nouveau/gsp: replace zero-length array
 with flex-array member and use __counted_by
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Timur Tabi <ttabi@nvidia.com>,
 "gustavoars@kernel.org" <gustavoars@kernel.org>
References: <ZVZbX7C5suLMiBf+@work> <ZVZxXiXYIzEwUE3N@pollux>
 <6517a6a41eb72d16596c913dc56467e0390287a3.camel@nvidia.com>
 <4b10068c-4285-41df-b4bb-4c61ac70a30b@redhat.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <4b10068c-4285-41df-b4bb-4c61ac70a30b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.184.156.122
X-Source-L: No
X-Exim-ID: 1r891k-0028aN-1Q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.156.122.cable.dyn.cableonline.com.mx ([192.168.0.9])
 [187.184.156.122]:48879
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPhfAKOKtOkSoHi7qFhn9joRwluVbIVRr9ZVnuS2ijSdY9/UiMiTLjgHumX5o0ihRKZV7bP5tkVKAIDjUKAwUl6bOjz/vnOKigTl2QBsDUahkZLDJXWj
 XvJyFNZJI8lfYThlRBjlpXTsVjSH9kAXki46M+HkOfVECcEXXdgZmARSoSjlEE2gPpgn0U2KWXKaqhWVSB6DoDC7d35sj+g40rXAPqCaLrf04uinXr9iFpCo
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/28/23 19:01, Danilo Krummrich wrote:
> On 11/16/23 20:55, Timur Tabi wrote:
>> On Thu, 2023-11-16 at 20:45 +0100, Danilo Krummrich wrote:
>>> As I already mentioned for Timur's patch [2], I'd prefer to get a fix
>>> upstream
>>> (meaning [1] in this case). Of course, that's probably more up to Timur to
>>> tell
>>> if this will work out.
>>
>> Don't count on it.
> 
> I see. Well, I think it's fine. Once we implement a decent abstraction we likely
> don't need those header files in the kernel anymore.
> 
> @Gustavo, if you agree I will discard the indentation change when applying the
> patch to keep the diff as small as possible.

No problem.

Thanks
--
Gustavo


