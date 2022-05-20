Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5035F52E6C4
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FF911B7B0;
	Fri, 20 May 2022 07:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic307-8.consmr.mail.gq1.yahoo.com
 (sonic307-8.consmr.mail.gq1.yahoo.com [98.137.64.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C7D10FFF3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 02:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048;
 t=1653013309; bh=O9Iz0YCSaCQOHi8+J38vW/gZxqJdLA0UYeA/SDg5U+w=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To;
 b=jOiM7JT5VanGyuKRieA98Wppi56m2wqlZrhriyy+zCzJTeQqBVbDAQFEIUOysTqxtnkEMyBcIEMseQj8FpRIrdItX/L9jDgZTaYTokRNvHfqfRIkr8M16m/2pewA79gfkM3kcH+LpI4WEqtIllo0Sp7ubx/BxgMIdhzBk2hLb7yUwcdn37WQwBycZj8nM+SRWsgMHaXXrL2bUx6K6F7VTPoJltqYLguYR7LD+0tqgTTenAvaRfbWWBFg7z+xdQ1D4suOG4Cm+j0GLNMb8PiEb+A0vwEp/F8TWNe03T6isKhyg/VsLFZk6dA4OKDZeMljwlWozdmT0AbW7JRLfJgWfg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1653013309; bh=6MGScbnfauf9PPcM25Q2+iWYrJGmOgdqYWQb0WMLjIE=;
 h=X-Sonic-MF:Date:Subject:From:To:From:Subject;
 b=GUbmXdo7ITGpi/gQoJwtZsuJkduReS1ZzX+3bskP0o4sZfBSYyWjZ6Dz9m+cDy6239bj0pDIE2eHPJwLPk4JW/36vM/nXSpIQuV9M4C5jT9uUW29PFZWawswtOYdaOz493ziM070ZZBC97t/BqJdWV2QJTpYRiUWbU8A78bZzN88BrtrvQgfu0WhrtRAL/o/ObqQzMaAlbxo5bO+E6GhWi75YCz5xXZAG/KXNEJHbXuV5bgKe/29K3ab7whcnx16f0ChPIpj88IBTsgo0lymw8GXl4TudQFyC3Kk45zQDItyjbCEkw8hIvW+evdOkra1b959VumT5IjolhxsLWQYng==
X-YMail-OSG: emYvzjUVM1l4fqlM8exikyXPZwlQsDInBWS4j_i2OUXqFaHZYmDSDjzSrfvrpjl
 AwPzBYEYO943tyOm0YwVTonYKwFFFXDD.yKkWG5MmOSnOcZfI.7NJ.7881xRdint.9WXx_qYpBbF
 _mTY.b46F3xY.Ey9zma_r3WqjSFrhtAOIHa7upoePwDBthFd3qIYYenlO1iG4xo2Q4UrJALbc.jL
 7ozE7_VZoGKo8tTaDLXmuFqF_C9g6MfwRR5UxBIf1GsMrjU0Zf_tUXHfSpUCew._TR6f8BkmQiaH
 NO5p81elA1WZfj7B7rEfCBM11P_4GW5p2gEtbA4O6PF.NLcOczqTefIpJDW9iBVMkq2w7t84_RAc
 ebtwvhbFk7lr.ZEoXwN0jR7ajgGDL7bjG6YbNisMnIw03n1lGlee8xxXXL4eO0IUj.WOE_8VvO54
 NpC12TWwNV8P_FbZ2jcua1ygFk6bUax3w8s17YtNDeIXDZFYapFtgnHMHgchSukH7nUgQxV4fY3q
 zJxuN5IB1YVmaxVvFGk4m8I3EhKTwznKYLzhmgiGjx8OdU3S8pfl7H__tvmImXf.4SnLoIzhCpPK
 VhUg2gIAIonKK8AImgaiDU_aYMLJ1nejjjBFtBL0WtiRfh_vwHbH0cW6U3pdADF2bX0kurFvCwnI
 Zw_jAZwY5CwQxstWSlN_yXkMqeCkikfyb6CX9kOUvdP3ZcbKBJrkBuWKieRAIryrNQ4RDpGs1PWY
 P2LisBH5YMbmPonk1D0eyeWOOcjqdA6AFWblsTUA4VSIW9FdqIW7dxCW3uKd6EhsgjaNcEThOExz
 2tvW2Ohe5rJ.y1CcDg7XJ50EXUKPV2T3PwAIDSsU4PkQprntV10jBiXr2FLnk_EPBy1w4laW3kYh
 9F3gxChZgH19SpE9KA5tH6Q69hIn0rj5BzVmVQMwukq0v10cFNt6EenyxOiI97bw70xd9kOvJ5hO
 e3XGmYri6upDAOVSQGGGBGiMxEf9TkP4t9GQYzae8ozGyAhMnJzI2X1GHsA_1pgjY3NbMON09Ywd
 8Flg4jguBYAnVUEXJhnxNT9m8mg9x7uarMlTwE9mv44J7iL.a5WwsEXorW.RLwsXoby35YKUkTNw
 Ttyak04SM_7zJPoJTDlBefld0RUFDBCyHju4H08iY2KLqhQTEhLhJLmZIPqg2pQt_2td9sISQ1kF
 OEJh59pDwZGFCaFegRaGjiILKv6TAN_rpVvtAWUd5.DqbCytdR8OqGjJFt90GAWbXPOypTe5ut7r
 tqvf72keSq.X0vwBF8j5x8RYZ.faP2tFPiEJrp1c2n264kZPvAqrWhnKOIrLNX6qBUJsxrFRdzqt
 t5gqbK42Hbao6VdWxM_7e7Vewv.UkOVou4h23Hjto4ul4P3BQwC9WJtVUyWirWtw0_HZ5fkXew8V
 jCSnji4tIfDrakSykIuZQlB93U2hKnQ0S8806GD6bkYEsYWUWw4xSXuyf1e1DM8vtjDYbS9_N__R
 bX3.X87tSyUPXAZKcKOg9aYurFvkpUcOCDcwq3Qmtd67mFSAQZrhkrXfujeds_1hlnEMi1vAAgpo
 QuzkwZF76gzpeypkXGsPB9Ep4YvZMB4VQ2vEsnGK7GTbWT3iBPxZpV_FwuPxwne0OLW9mPYLB1TS
 scyTix0mlZPxDKb_TGI9sSrXs2SAAQaNMX3F8vHdtY3L29ITOMIDRfY5xP981y_ePA9VzaGneWQF
 DVS3mz5e6_Mf9uiosyyPsJVFpF1uduwsnHDs2Qyh8j_QhrXf9nrs_hkksclxsTFaUCnORq6hA6OO
 AXXorcTe7aMAwovCD.o2T7vhe0s2Lg1990gggcrlHF3o1lX4YNNbH20KerVCcSoe6FJ_.sKpxJHY
 c2QJEYlHUQlStato1ygy.ERiVXvw57q67pyZd80BRSNB42QEwpaqd9R9bVOlleprcPzjVNYDoy27
 r3L114EPmz4vkeUuJXwD4qd98OHpmZVXyztywsvgDMoiEHKhegr2mrG45uIM19VnXjOaDHgBx.hm
 wYGhlEGkfYHvOao7ClN15NrGwrFm9sXHFg.gnL_6j_83lqupNs_CEO1f6MThT_1OGEugH0A6lI9y
 Ps4NteURzQ_ckISrzZrhzSafJUxcb0EKmZo.320_NC3NsYNPFQPnBxclrybUuEriY1MqdspZfHQ5
 l3okdQcehIkxgUcQBLvByeZPWuQjI.uu_XRiPEwCwX9AIsG3e.A4WrBDVMvKxwyAkQOgIXJ6yvOv
 N5YdxJHA-
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Fri, 20 May 2022 02:21:49 +0000
Received: by hermes--canary-production-ne1-5495f4d555-vwstm (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 418a811caf32e9bb9537443005bbc38e; 
 Fri, 20 May 2022 02:21:45 +0000 (UTC)
Message-ID: <c9c4ca95-0423-a50f-f417-776ccc7904e7@netscape.net>
Date: Thu, 19 May 2022 22:21:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
 <788dc391-6a20-5c03-9613-9f22fcc125f1@netscape.net>
In-Reply-To: <788dc391-6a20-5c03-9613-9f22fcc125f1@netscape.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20225
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
X-Mailman-Approved-At: Fri, 20 May 2022 07:59:06 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, pkg-xen-devel@alioth-lists.debian.net,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, jbeulich@suse.com,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/19/22 10:15 PM, Chuck Zmudzinski wrote:
> On 5/3/22 9:22 AM, Juergen Gross wrote:
>> Some drivers are using pat_enabled() in order to test availability of
>> special caching modes (WC and UC-). This will lead to false negatives
>> in case the system was booted e.g. with the "nopat" variant and the
>> BIOS did setup the PAT MSR supporting the queried mode, or if the
>> system is running as a Xen PV guest.
> Hello,
>
> I am also getting a false positive

Sorry, I meant false negative here, not false
positive.

Chuck

> in a Xen Dom0 from
> pat_enabled() where bdd8b6c98239 patched the file
>
> drivers/gpu/drm/i915/gem/i915_gem_pages.c
>
> I think this patch also needs to touch that file to
> fix the issue I am seeing.
...

