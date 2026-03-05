Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DCqIjc+qWnK3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:26:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB12A20D6C9
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E68F10EB67;
	Thu,  5 Mar 2026 08:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="rxw95lAl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33B010EB67
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 08:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772699170; x=1773303970; i=deller@gmx.de;
 bh=aWowxhoRqPVT6RcAMsxENBPF7N2rx9OWir349BNNpC0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=rxw95lAlUaVoeMvRkTZDbmu/8OM7jL4Gbq3k2FmwUHLA/9cDkAXcoItwTe0CFeyE
 ndQoJ7PD8ep2txSyYyB4gPizxqnIyxYwFlu38Oo6kcwyKjp5cnb6XRzO4LbDjxA9I
 S2Ir0QlZn84vRysyLnqXaELg9fdirEqA/ZlK68gaGmclAv52X4BmVnojX0s11um0w
 66XrGwC6ak+ZKnwVRm+WSf6s0hFFQv2sDfAXqYbjOUVbTmiAWUQgYp2Pn6sjEZoH6
 1Y41oQnzgE6hm5Q+Ub7u4wBtwuaqRSiWKdPrQsyfCaSMK36hGDwoiIkQOWCYL7yib
 EOEsDK2fHBg7yo02dw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmDEm-1vGAcr3AZM-00etT0; Thu, 05
 Mar 2026 09:26:09 +0100
Message-ID: <1838a3a4-764b-49dd-88ea-50ff84ca2e6b@gmx.de>
Date: Thu, 5 Mar 2026 09:26:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: wmt_ge_rops: use devm_platform_ioremap_resource()
To: Amin GATTOUT <amin.gattout@gmail.com>, Alexey Charkov
 <alchark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20260304-master-v1-1-2bfeb1b9559f@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260304-master-v1-1-2bfeb1b9559f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L2Q+z07QHnX8krn9ppUDCg3n2FCL1k4BsrP+BmvGK0ChlKTLZpL
 i8wQflkvNszkJ8Z/211dlPcww+dRBFrMBPgmeIJEL/3pQGuNWKb/FsGnabmbFv2ipeExOuv
 tpUA8nDtEe4pf2amF4yUroumYKgzjdaWDiiagON099DLuAOB/m0tB2kHBScJw0VEbvASl/i
 rmG6mwWnfF3bMhLfuWgUg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tuJq6DbuoaI=;YC7SMJ09R4GqgIAiRywz7qBOrc2
 nde5WoUgI7moWYIW+lWHRuWDE7QWlqQOMNi1R4XdP5OGAJt81GGwCURaT22uUHP0ayU2tz7rM
 yPEIVjs3xzbH+FV5nFjXQiDe3Ww4WI3ZVNie+7T/IhL/VdqM5IUS6zwCEcDJW5llLF+kg68Vs
 A038+UCRmZZn4ojM8rF0NH0yMc6cZ+iil6lzAXpfXXd3fjzgpIvmsaunkm7cqQfqovjo8CGYY
 0TUAgUwE5xRuk2ho55gGHXRHCOTjSxmxlrKCpM0+rU07zVvACP2oT3CmUXItlQCehkH4eakFt
 BXHBIw+zjwrdbRaaypJMx/KuQnz1kpKOiYn6jNa8HAdaO6q5nf+8SoryYPwa6D/wrAVVWxYKY
 layHXvCwIRLow+iSITz7W9qAzsV4Ai6r2NQh+XJpXwasRdUqgfAZfYZClLvvRkomI+Lz6ElJQ
 Y3321O5f/gsk6BCoO7j/jngtNQRzh9V2hfqesIJI3y9v6pxjHBP/wrusDLlLmDKEzFpv+9+Wg
 5vBQ6N6o4pGdZLVFd86B6hCoJjg+Poz6azJuASOf0QmrWQ6laUcLhG32VZA0L7Xx6rpNFhLts
 f3ljzBfCBTttH1ger0aBY9NHuh/QA/cOGC0l+4oXZnZ16TMdH6dqulRY2sXGPxOTG8S7Erhid
 IWa8WMajbnTmQOs7MONmMSRkQ4e1l8sP/Tm7TYqwrH8l9Lg7CWIr90loTO++eVCKLTyLku8yf
 31X0VaaKSAAPNVYbkYjcC7G9HjmeE4UTKq4aWgQjqU1313Z0+PoxlRMYnO4JsNPYyvlfB64jT
 MJr+dTS08l2mmT/t0qwVa+wqFdr0eQl38dXJNTwlp919nibAp1TDdnj8ujNXzGmyeB3RqGAin
 UTKhirYLF3RRmaRR9LJQMnsZsAyqqa46rWrgeQ7wTH32NHvzk1ue/iusjWBP46Yvqb0qlJnKS
 1hkjh6nBueGX2HmrzTkSz2h9GZATaGNelhwjkfYD2uHQsU1bygimVyY5rigSGppMU1zv+V/PT
 LEbcYdvBk5ynon8p7ESOKbF7EF+Rc5pcF+NKqyS06vmrOeJQeyYhkIoj9U/f+BSr3XrjOo5iu
 9G4LEIExJW8IouFO722objzS6rFKVblC23dZ8HBjrzE/3Pp/WjWtA6md/siHph6uL0x6OKTqU
 05kXuJk/JNOil6nk739S2w373uDAY8YF2qAP74DwArXaUwXOvifBZ5MLMbNFZs1k0uF/e0GYM
 s/89othsmT79s02s4TDRu1SIe1xjRTgKSBH+J4bdtxlLtJk4dPxcExdwFXxeKC9mS8zj4sZCI
 T3MBb4WfByfGe7wqRvJMlU1VUq9fOMilSuNXqqbEPyN4pVwiUtL6Log/UeOWV6D9+bJCL71ri
 IHAX33WsK3Umc8BN4EvcHGZIPDJv/6jWJuJGFIx64+CMZyvOhYUs/4PfT68eVU1C4/iW+BQLv
 QfB8ARcut35MjiZufhszbfycyYMJmXLmFBylJRmSHzTkwJxrPqC+QJp8kcXyzgD8LFOM8dIfP
 yMh5VH3JO2t9uwCL4CHH3v9R+G4/uqWATTzTPyiTUfNUuVSywCTt+ukulWZdaaCf6BQGgYuOR
 KsL9NmVgbyOL5TQ+w8hfyS2TcLAZOHzk6AQYVQD4YvI50GsRSLTQ3JgUkoGxvppdAFOGywEKp
 daCr3b1wPR+8hugP37mdq8l1tMbtL93sGAQdywVDHJ18qhf8ZN+Mldfkuh5PF4uyVkzZfgnBj
 NLiS02dPCUwr/0XWowefTS8Fcf6EQXgPzM3K9+nH/iiqbZ7w2wDX3zDg/QJjrdRhaT157T8ci
 MF9zM1pgwjtvSudUVdhMNJYJH44w/VhMc/+9hd7dF92nVgUQxdF3iPUeaLU/0RNlWVa1ce7Qc
 NJMV69UO8MyvWS3OGqqUcSzE+sy7USyRNKiKX5FX6OAQ9+4GUqZ/itRdULFcBzvJfaECWyO7I
 5bodJvJooJgI7NO4VkG+1HlUsId4m+89HXwUl5SAjOVCn4HxbLrMaDzQLzmdZD10u6QnbvMsC
 dY2A+X2t0BfWzkBiB9Azf124IuIbundyQJLySwUH9TZ/nJuNAslf72rPYTzdmy5yta+gtWioN
 qiMxu2otdAykqd8LtwIogl68kgKtTf42KZ82SuHfSlBYnHg4DELvS8Xe3J0kKwlij9t8Bxsha
 vk9llVkhPJnLaIlywsV9VYxJlDhAFTcEChFN4mHLuVCphytw3jMb88LQ5b4ckAZdIs731Nzyd
 0i+WDBv+Jnwwn+Y9u0qAyXCyYkes7f3rGAOkfDR6kzZWGBBQHzqRTdGnoYzE/zlCcFOcLQBCf
 EiuvSdFqpSLYR69UIG6egH+LFC0x+r652WsByU5291w5s6kP90Bl7ngOKooWebA0qtg5Lduuf
 k0i2ccYNcedEZWzqxU/SPS+fqdz8H445b57u7j048ni2ccws/0957TEyWNO18GP4GwKWyUjC6
 bjvJxmiM4spe1DM6YTAHswJaPsLTvXqzg4pYJ3qaAzu0UMlz/0st03UsTDyajxtt6pn4WNdd7
 vWYjXnlqS/pvQvo7yWks4jy/kRsJ9kC1Y9MLWFgSJP0pY2+ftLxgM1V/P3fl8Kedv9ST1C9SN
 mVjVHYs9ssgJaoDeLr4xx6bg9IS0oqa5nsBF/AP/p2hPP6iIwEhrz6jjNf5vm0sWKyY3s1vPT
 27XxmHssNSGf9wUwPjdgM+TscQu3iQyp4rt+e5UOq708mlU67IdCA8MD5me7U2X/0jYOnHfDw
 Bq9boANbvtwA2J2KdgByBeYoI5mcVbER8FWG8ADi9tBaENbd9sDRYyaYP041d0S2KQwj00w5S
 3kTe2h5nnv70dUKLqY5LILyzQ5O01mzfeqOknEhr5oL4yYy+aCKJZi7ZU4HwL+KI02imoXTXh
 HodMMbiE3rcxThxx3eB2ANRsERLqikX4uA/3L2N6gdmB8K+U5pWKAAPsjOfy9CkV+Tku3mJF2
 xwfGOR4p+/iqmtT/H5fcKnUiQQ4YByuYqKS0NTZrFYywBpvbpDuJyNARutJ55oSDDD4mm63s9
 /A9CEinbW1zFexnGgh8FHdJvOLPPyH3yNq9NWTdkIdAywQ8P1qLoie6esniYfGARdQ1sNrW4A
 nQfhso2317kgcVibZh7+HwaGKQ/90wpFupew91vNbKBBTe5nFpzpEd/qOnJKP72M7/KAZ86V4
 brvEqY2A3O7MLofhuTzmIccKCLyA/66ZACbMiiuo54+Flnq/uSnAp99BpwWmmAGD+WrPdZa8M
 07hr/bpgG+DJy7LP+j2EEllZoKcF6I2AxYf7PqRSYQIGiMQ49qvpAGEWRXBmXd+Y4UJl4Hnlb
 YrJf2Y6deZh3K6cuBNskGKc38dVVw83Snvo8EgGTCudD/ZJgbKKh8qWywj+wzGR12II6HU3qq
 2u5Gg/Swfe4Rd2I3/X20Ekazm38NFPJNXtHI3FaiMw7ltY2ufsojF4Th+nS3weV7QH1blh0jC
 u7CkUy3mh1fjCG5udIHZvRHyBX1qPSgG8CVAtkBhIjnP+BJYN3SRF8GjZ8PFZWG/SS0Vjoheo
 /OUTa86T+V4DijfgLTXtGp9UpbVHWDmigue06MFJMP3Uab/FQs2T+ioyVv7NwrxQ8DLeQt7GW
 IHopOPU7A0SbBtFgkpKIh5M2SQKlgKwgbXX0mWUu1f3fZrDMf4/Wtkf9qeb3y6PH1nou0Uhty
 FE6aYUn29d9bFB9IIGeHCTgARet3pbvQdH+Hulrhjr2uWnJeba2eTVQNAnFKx5Jp3p7EucEIc
 K8PtXcHYKPcCwqRsGSkgqaM0jsjWejQ9d/pFrZRCQcWj8flh+FG9z4KqC75bCWjXm7XdJIwLF
 tPkcwA+asH1XD1i8qfRwa14r6Wgmy9oglVFQuaE16vdSBXa3MJFt8JMcyGf4TbhW+5fwfIYLa
 WhdRbgkrDhwwEwhTxB/R5Zq2rp0/a49EnCIuIYz7+YJ+5E08o+u2u7THXzNE47zDMSMtlPyzJ
 30UML3s3ckkBrnnojP0MbsQt64cI1OyYdcOKQltz12NbXZyur4BMwJFmTbgour8S6s5+4oHy6
 S1bgbPMby7O9dstSfpz0wiRTJLFijq53oZoygT88v+UaE31rTldGlpibzetQnz/KYSva8v63+
 MLsJhLedxboy9Hm61mLlW5JM10OlZZkJxZHu/UwH1O0dYrZasWmxLYNICQR2VYoW31fMM/BC2
 JYmbp8fFgqJxBzV68+hgiaYjgaeC2p4HqGImVsy2O4bA5uPBHvfAp35fGhDq1C+Gx6qE2+/jk
 B4pwmzK04AFJuXfXZ3C/vuIsPiuW7Pe5NP/NHL6Un93VeDCXXwuDk7A09GzAk6bHxg2rQk1Ok
 8TZpDXgIdqhoCF9auZsVPuEB7XBHcPH8RcAKcwj9wEUq+9QoDp/VzWTkChEBJ+DVUBOBlrRT3
 ha40WDGN+QzA/aexBsOSM5DWcFlPbOxm45Xr5kh6tG+8i0FUE8yogE5LGrM5u1f4wXwcbv2Pg
 d1AeTPsmEejs99pK83FSloaIDRwe6SsTYY5HFJjh3E4gN7SNTSn65lstdmcnYasI4/vpukyrO
 Jg7b5/412eM/chwPvaxyos2fDx19/qekcXPJux1U13i6IpytYYeIXmNrV1hvLDBh04kHYsMkV
 giUsQfXSuBq8JNGXRZn9prU5DthewzCYiIL1bcLyOScjcxXgeOyhvfcMDkAZ8bxDMAkgQ3V9L
 SdXUAXhKBrivxWbQumrIsX3he3L4QP0qpkFpki+wfeUSnX/EismMVBQebGU23653QKQDHWTFB
 fljAeDeza7euRQzJ3YCMKo5FuNVAzXY2r3WXf9Km3pk7UGGP3hVHO+uEErBD3p+Gr0rox4IZc
 bf7/NA4oHtBX6yIS1QPAvr2nr2Fh9Vj/Di3BLgGobuaq5azx6bdP8WCRFP8PmMnOU8ZBoidiY
 ZYKsd3rSDYd71UNtqCiCrCOialzqxUpJwL/KiRdb5FffKAIqY0/cskj6CUoa1jBlr2ThmJ6x3
 /3t/5Y03NuB9NYbg1fD6Fsrel965/j4QvyJ+Nm1fPgp5+Col2xK/51fLzOtw/tKqesGMa6CTu
 1rGmNasza2NTU2ynhUf0fMeF8wigS8PLltM5tsKp2GfwyntW8aqg31sEyhr0hnAlcjsHMPxJx
 P+l3/nrq90KQV4Xc0=
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
X-Rspamd-Queue-Id: EB12A20D6C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:amin.gattout@gmail.com,m:alchark@gmail.com,m:krzk@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tzimmermann@suse.de,m:amingattout@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:dkim,gmx.de:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/4/26 18:10, Amin GATTOUT wrote:
> Replace the open-coded platform_get_resource() + ioremap() pair with
> devm_platform_ioremap_resource(), which requests the memory region and
> maps it in a single call, with automatic cleanup on device removal.
>=20
> Also reset regbase to NULL in remove() so that the single-instance
> guard in probe() works correctly if the device is re-probed.
>=20
> Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
> ---
>   drivers/video/fbdev/wmt_ge_rops.c | 18 ++++--------------
>   1 file changed, 4 insertions(+), 14 deletions(-)

applied to fbdev git tree.

Thanks!
Helge
