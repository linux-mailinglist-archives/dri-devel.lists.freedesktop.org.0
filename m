Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3398B356AAE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 13:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414806E8FE;
	Wed,  7 Apr 2021 11:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653D86E8FE;
 Wed,  7 Apr 2021 11:00:15 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id U5uplBEN543ycU5uslQ6tu; Wed, 07 Apr 2021 13:00:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1617793213; bh=ftYa76Czf3j6K0UnuE67//uv+X0fqOANKm/3EZVBo/U=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=WmtmVzWvCxCyqOP3p8eo4RNyW5UYQMsha1SXcg9EaEu07YbsxQ8dVxkH7CnsQZ/SN
 Jj0Q2pWiQHnlGFsy0DV1gd6OOj+WfnYXkSxrIM7dhnOv6KA3fQI4cgWom/tg4hWfyQ
 8Q4Q6bRTW64YabBIyViugzp5a+WMRyE0hayhmqS7Qo/1ix8mhNAaXf89mx6JkOd/u0
 S+BwBeN15xafo0H4eUhAtFC1p9bP3G3kwvr7Z5IrAqmCI+pNzRarXhCtgdYRp2NSCT
 XVINx3hcjZTxt/QiRzAHDh/ZQBjDbNHD5gVn8UQaoJZIeWB3+lDfR4iAhvBBLglWXr
 wpAWU9CDBqNnQ==
Subject: Re: Call for an EDID parsing library
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, xorg-devel@lists.x.org,
 linux-media@vger.kernel.org
References: <20210407114404.13b41822@eldfell>
 <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl> <87mtuajshc.fsf@intel.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <33467672-b66a-7658-de04-7bc37153613f@xs4all.nl>
Date: Wed, 7 Apr 2021 13:00:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <87mtuajshc.fsf@intel.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfNLtk+7x9Jj4OEKzu0ztwxPJF6SAFy09BcQZw36bEDi+dOY80jNaj7uXMRlinAtAWadOKtbfa37kRDfv6KJD3/hg3CLDC1AuOdgkJnb0TwSLGmENsnfR
 Ub56A9Z5JksExyonDQ15gWA0UBRYqcGzwPjq7blpu1hD9FWGgbUa3twvarfGFv8ifDsOE8ckFoRWJvtrt7hOQBfi6lJd079qrt8g836ABMLVKi+QViYSdSda
 ztvPferjz5fk7AVDzL55DanWLDVPPgCo57sU8Lmr54FbQH634icbcxrf7GUUcilVy6w77a+1NfDL4mJyDHsbeFwUgngvDNlYEmGYcd0koPkTFOX612afmGo5
 4igEEKV7UbfS4Upf81sFtGa8uufw1gyDDurSU7nGwOlsaFf+/g0=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/04/2021 12:31, Jani Nikula wrote:
> On Wed, 07 Apr 2021, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>> It is the most complete EDID parser I know based on the various standards.
> 
> Does it support pure DisplayID in addition to DisplayID blocks embedded
> to EDID extension blocks? I think we'll be needing that sometime in the
> near future. (We don't yet support that in the kernel either.)

It doesn't, but that shouldn't be too hard to implement.

Do you have examples of that? If I had some, then I could implement support
for it in edid-decode.

Regards,

	Hans
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
