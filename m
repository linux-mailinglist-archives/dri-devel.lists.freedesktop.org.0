Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E26E984117
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE46D10E2C6;
	Tue, 24 Sep 2024 08:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="FTyRjvbe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1135B10E24A;
 Tue, 24 Sep 2024 08:51:50 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20240924085148euoutp014d81d8b6306e607e4bf3f5cba5893293~4Ig-EUA_-1855518555euoutp013;
 Tue, 24 Sep 2024 08:51:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20240924085148euoutp014d81d8b6306e607e4bf3f5cba5893293~4Ig-EUA_-1855518555euoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1727167908;
 bh=+OENs58HAqzqyrRb3PODk/cmg326VKfftT83cloY8MU=;
 h=Date:Subject:To:CC:From:In-Reply-To:References:From;
 b=FTyRjvbeE8EmsNK62SMrSA+7VgKYquSRnqZ8sf0a/9Musfv8e59SiytOejz1XTuAF
 ZpB/Gv7ZqjLHR2EMfyY6JnPfWgaV4W8+nzvH7mc2A1VNNathWqbn/2Ho5N4Q/wVepu
 7ptaX/HQSCvyxEcLlm+wPp3PsblRfCKylcQi6+gI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240924085147eucas1p14ec5d74b01509ae2d000edd5e6bfff9c~4Ig_1XQHX0782607826eucas1p1R;
 Tue, 24 Sep 2024 08:51:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id D3.BE.09620.3AD72F66; Tue, 24
 Sep 2024 09:51:47 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240924085147eucas1p166c893c894c86bb9c9f1a4a588f00c0f~4Ig_M8NsH1841818418eucas1p1T;
 Tue, 24 Sep 2024 08:51:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240924085147eusmtrp15fcc19f3a3d28b3166e599dba1351bbd~4Ig_KNUiJ2571425714eusmtrp1h;
 Tue, 24 Sep 2024 08:51:47 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-30-66f27da3d6f1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 7B.88.19096.3AD72F66; Tue, 24
 Sep 2024 09:51:47 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240924085146eusmtip2621f4dfeadc8cf4bdb0ef250758c5e04~4Ig92tMVK1318013180eusmtip28;
 Tue, 24 Sep 2024 08:51:46 +0000 (GMT)
Received: from [106.110.32.87] (106.110.32.87) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 24 Sep 2024 09:51:44 +0100
Message-ID: <33953236-138f-4141-a5af-9ea60d148ed3@samsung.com>
Date: Tue, 24 Sep 2024 10:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] Documentation: add howto build in macos
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon
 <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, Samuel Thibault
 <samuel.thibault@ens-lyon.org>, Paul Moore <paul@paul-moore.com>, "Stephen
 Smalley" <stephen.smalley.work@gmail.com>, Ondrej Mosnacek
 <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, James Morse
 <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "speakup@linux-speakup.org" <speakup@linux-speakup.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
 <kvmarm@lists.linux.dev>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, Finn Behrens <me@kloenk.dev>, "gost.dev@samsung.com"
 <gost.dev@samsung.com>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
From: Daniel Gomez <da.gomez@samsung.com>
In-Reply-To: <86cylev7o7.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [106.110.32.87]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTVxjOuW1vC1vxiiycIAFhkAXYmIqMEzDOyTDX/XGLGUY3szVwi4TP
 tCC6AKmATEAmoPJRBaGVTxmwAl1BSmPFQoEKBMMKHVBTQGBFRGTAxuygFyP/nvd5n+d53/ck
 h8Owf4M7cSJjEyhBLC/aHbdlyjXrTz6Rprzi75d3+aGePyQYWqy6BpCmbpaBHljGGejpyiKO
 0qWNOFprnsXQZGc1hl6UOqPC+1IclQ1pmWi+5RETyUwjLLTRrsDQcPsdHPVLc9lo6qYKR9Om
 KhxVLLUy0TOjnoXa7mhZSNk4jCPZ8DILZWZVsdDPtdM4eplnwdCMsoeFbq2bcbSQ95iNDAVF
 TKQSj7BRzVoRQAPdGjayqFyQXKED6PnADYBKDAaA/lJsBreY81lIkhmAMv70R6OVTeyj3mR9
 WT0gOzQ6nFT+Xc4k29XNONkmHmeT5bJEMqNrgUVKO+YwUlaXhZNlWWUYack1ssgui4RNVohu
 Mcgy7TekqrSeTU7mdGNfw7O2h8Op6MgLlODTIz/anu9/RMXr912cmTPgIjDmlA1sOJA4BCfV
 KyAb2HLsiRoAh7t/Y9LFawB7V6+w6GIZQJ3kKfOt5d8cNU43qgHMKb75TmVSmrbD2gA0DCyB
 LQuXOAKNjWLGFmYSnnC8IYdF87uhtmTKGvsB4Qonx4rZW3gPEQwVfb9b9QzCEaa9rrXqHQg3
 +GpQax3AIDp2waapPusAnPCCnVqZ1WxD+EDtpHST52yKAmFRzwk6xxWmt95m0Ce4weL82u1z
 UmBvyxhG4wfvQfmcLY2/hPLh0W1+D5zvbmHT2Bn23bi27Y2A9xrE2zgedhjErK2xkAiCv/RH
 0/QX0NCwzqZpO6hf2E1vYwcL5EWMPOAp3vEQ4h0Hi9/tL96xfzlg1gFHKlEYE0EJ/WKpJF8h
 L0aYGBvhGxYXIwObX6TvTfeKAtTML/mqAcYBagA5DHcHbsHoEt+eG8679BMliPtBkBhNCdVg
 L4fp7sj1DHel7IkIXgIVRVHxlOBtF+PYOIkw6X/P0tIveR2fWLUb4pf7mPcfL4lZ4B/tvdBX
 qLlbKgnWzlBhj59/VpLAnTW62PgcG1WFVn77UibS6Zr8e8OI7z9Ub5xM9FIpyYD3q5pXI8+G
 3tWHSo0O5wb511f+cU1ejovXBdpcHgG3Y4MmuCHOSQkeAQczr6tChqKGhAc0+uj706dOv3ji
 LOIHJacVHLxX8bndsdTKPAV4WH1a4dg+uBEcJTmXupDyVWay6DuzQ3mLW0i+weLXcWafrtCs
 73QzJjp4pH5UetXOqcrsfdUL9A4euuKRffKhMmkkeeLXw12hucLMy4H+GWcG+S5rxMh4yIpJ
 FuV3cXH5VKur0669H5vcmcLzvAPeDIGQ9z9+jZ1mkQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta1BTRxiGu+fknBNoMz0glzW1KulVWwIJt4Uqvc20x1pnan/YInUwowdQ
 gTi5OK0jHTSUQpQRgqikkAECCJQpEoEE5FITCwRhqA1ELkVALoKFKqitFGoKiZ3h37P7ve/7
 fbuzy8U9jSSfeyhJwcqSJAkC0p1z42n7bX998kJsYMnPJOq4VYyh+2VnAGqrnMbRVccwjnof
 3yeRSl9NoidXpjE00nIJQ38WbEDnf9STSHfTykH3ai0cZBi3E2i50YQhW2M+ibr0mRSaONdK
 osnxMhIVzddx0NhoP4Ea8q0Eaq62kchge0igtIwyAn1fMUmiB1kODE01dxAod3GWRHNZv1Bo
 SHOBg1q1dgqVP7kAUE97G4UcrRtRvakboLs9OQDlDQ0B9IdpJbh2NptAxWlhKPX3EDRQepl6
 bytTpasCTFNbN8k0/1XIYRrNV0imQTtMMYUGJZN6fY5g9E0zGGOozCAZXYYOYxyZowRz3VFM
 MUUpuTijs+5mWguqKGbkdDv2Gdwr3CaTKhXs5nipXLFdEC1CYqEoHAnFweFCUVDYvghxiCAg
 cttBNuHQMVYWELlfGN9lYY/2b/56amaITAGDfDVw40I6GC6dNpNq4M71pEsBtJTV4a7CBljz
 qI9w8Tq4bFc/E80DuHhZg7sWDQDeXurnrKp4dCQcrdY63Rz6NTj802nCte8BrXkTTo03vQmO
 DF6kVnkd/SE03TA69TjtC089qnDqvWg/uPCrFaw2wOmmF+H4bA3h6qbGYfbJTqebpLfAFqvB
 yW70W9A6ogeuJAT1s9coF2+Cqrofnp3HD17MruC4OBk+/HcKZAFv7ZoBtWsG0a6J0q6JKgSc
 SuDFKuWJcYlysVAuSZQrk+KEB6SJBrDyguvbFmtNoOLevNAMMC4wA8jFBV48zcB8rCfvoOSb
 46xMGiNTJrByMwhZuaVsnO99QLryBZIUMaLQwBBRcGh4YEh4aJDAl0f29sR60nESBXuEZY+y
 sv99GNeNn4Ltjce6f7Otr/1qqEAq1u4BldEdph0lZOwXhuSxSPuJXRpjSYOqUxpcn+5j1+Z8
 nOufPve37fVvd9DmVj61K/eF59YnqV8ZOxbZeesjxkf3NG1qd579Zl/L2LlhVR1yV76/MSe/
 r/TUdO/oJftjSbmC3B4xMRzA8KI+5apHwvLufODn/nJTm0XGvup2bVT8/CQ3Jn9f8uEH/Uci
 cN+oN2qM3prjhp3kO5+8G9V5xsw97PhHlf6l5eyy154ZXHWVr/DQfNf9UnLH0n57UaZSd/LO
 2wM7PWhvS7PRNrElp8V9wL+jPCuPN2P7PPG8JsanYCG0882uQTwnOpU4YQwS1t01ewg48niJ
 aCsuk0v+A+CoJCNKBAAA
X-CMS-MailID: 20240924085147eucas1p166c893c894c86bb9c9f1a4a588f00c0f
X-Msg-Generator: CA
X-RootMTR: 20240908090349eucas1p2a9561859c83a19a8bad4ea2eef184e35
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240908090349eucas1p2a9561859c83a19a8bad4ea2eef184e35
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-8-06beff418848@samsung.com>
 <CAK7LNASpWSXbjF_7n0MhosNism=BpvHOnKsa344RPM_wmC9dGA@mail.gmail.com>
 <CABj0suBQCc8=0tLng=OWW=K1hjFuLFZWhbjsqHtz2FzZt4i0sw@mail.gmail.com>
 <CGME20240908090349eucas1p2a9561859c83a19a8bad4ea2eef184e35@eucas1p2.samsung.com>
 <86cylev7o7.wl-maz@kernel.org>
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

On 9/8/2024 11:03 AM, Marc Zyngier wrote:
> On Sat, 07 Sep 2024 10:32:20 +0100,
> "Daniel Gomez (Samsung)" <d+samsung@kruces.com> wrote:
>>
>> On Sat, Sep 7, 2024 at 10:33 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>>
>>> On Fri, Sep 6, 2024 at 8:01 PM Daniel Gomez via B4 Relay
>>> <devnull+da.gomez.samsung.com@kernel.org> wrote:
>>>>
>>>> From: Daniel Gomez <da.gomez@samsung.com>
>>>>
>>>> Add documentation under kbuild/llvm to inform about the experimental
>>>> support for building the Linux kernel in macOS hosts environments.
>>>>
>>>> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
>>>
>>>
>>> Instead, you can add this instruction to:
>>>
>>> https://protect2.fireeye.com/v1/url?k=f33af8a2-92b1ed94-f33b73ed-74fe485cbff1-7d382b34bfd617fc&q=1&e=c7a3e869-d48e-4168-88a9-03cd717797f0&u=https%3A%2F%2Fgithub.com%2Fbee-headers%2Fhomebrew-bee-headers%2Fblob%2Fmain%2FREADME.md
>>
>> Sure, that can be done as well. But the effort here is to have this
>> integrated. So, I think documentation should be in-tree.
> 
> I think this ship sailed the moment you ended-up with an external
> dependency.

The external dependency is not different in Linux hosts. We depend on 
byteswap.h, elf.h and endian.h headers. However, these are provided by 
glibc and musl, and macOS (at least in arm64/Homebrew) does not provide 
any of these.

To fix the dependency with these missing headers, it was suggested in v1 
[1][2] to create a "development kit" for this hosts. And that is what 
Bee Headers [3][4] aims to provide.

[1]https://lore.kernel.org/all/20240807-mottled-stoic-degu-d1e4cb@lindesnes/
[2]https://lore.kernel.org/all/ZrSoOM9z4VnqhOf2@fjasle.eu/

[3] https://github.com/bee-headers/headers
[4] https://github.com/bee-headers/homebrew-bee-headers

I don't see any other alternative to provide the missing headers other 
than the suggested. Please let me know if you think other paths can be 
explored and tested.

> 
> Having looked at this series (and in particular patch #4 which falls
> under my remit), I can't help but think that the whole thing should
> simply live as a wrapper around the pristine build system instead of
> hacking things inside of it. You already pull external dependencies
> (the include files). Just add a script that sets things up
> (environment variables that already exist) and calls 'make' in the
> kernel tree.

Agree. This aligns very well with other feedback.

I've added a script to the Bee Headers [5] to help users init their 
shell/Makefile environment.

[5] 
https://github.com/bee-headers/homebrew-bee-headers/blob/main/bee-headers.rb#L28

> 
> I also dislike that this is forcing "native" developers to cater for
> an operating system they are unlikely to have access to. If I break
> this hack tomorrow by adding a new dependency that MacOS doesn't
> provide, how do I fix it? Should I drop my changes on the floor?
> 
> As an alternative, and since you already have to create a special
> file-system to contain your kernel tree, you may as well run Linux in
> a VM, which I am told works pretty well (QEMU supports HVF, and there
> are plenty of corporate-friendly alternatives). This would solve your
> problem once and for all.

This is a use case I'm trying to avoid with this series. QEMU HVF works 
very well indeed but extracting the built objects/vmlinux/*.ko etc is 
tedious and slow. Building natively allows users to boot a VM with QEMU 
and -kernel argument directly. This is way faster than the suggested 
alternative. In addition, lldb can be used to debug the kernel from the 
host.

> 
> Please don't take the above the wrong way. I'm sympathetic to what you
> are trying to do. But this is IMO going in the wrong direction.

First patch has been merged already and after some fixes in the build 
system from Masahiro, this series only requires a small change in 
xe_gen_wa_oob to make this work if users of this provide the missing 
headers and set up the build environment properly.

I will send a v3 later today with the remaining patch.

Thanks Marc for sharing your views!

> 
> Thanks,
> 
> 	M.
> 

