Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD019B427FA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 19:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D9210E1B0;
	Wed,  3 Sep 2025 17:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="JDeTD7NU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2611510E906
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 17:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1756920664; x=1757525464; i=markus.elfring@web.de;
 bh=sQSdsEyKd03PoGo1S9AyOwCwrCj5ZzNJZe6aF37J244=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=JDeTD7NU74XJPwH9aXpNtFBf34sGtaaD//rI+fPsuGbt3PdquOIRQSpBitcxkGQB
 G3I/B2U0/fOB8QHqPDmJ6pIrGS+H9r0pxf6OO+/U1z0ie+mjhRuZkZcGvLs3Jp6gr
 RRF+17AF1ysO0d9XhHk5T+m9aY/euVK49yNTSzabu4yiIrK1fVmYGQhfwPuXNJRzG
 kKe4jxTlBLj3JN6uIklXT6ggjN+PorsvEhbrka98pr+1j6c1OxR4bT9WSO02HQ6Hm
 WMMIe2N0mMq5SkSmPQB3I4kZX2P+u0nYWoKQqbuMfk6fsXQ2/FiY62IuvARuNxxhg
 M9Qpi4Ic8aJfNpq7kw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.225]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MKMA7-1vB6eu3gJb-00U41a; Wed, 03
 Sep 2025 19:31:03 +0200
Message-ID: <2dca6191-fbe2-4b4e-834b-5462ed4abbd8@web.de>
Date: Wed, 3 Sep 2025 19:31:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Miaoqian Lin <linmq006@gmail.com>, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <treding@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20250903140035.2529812-1-linmq006@gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_As_the_doc_of_of=5Fparse=5Fphandle=28?=
 =?UTF-8?B?KSBzdGF0ZXM6IOKApg==?=
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250903140035.2529812-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:87SZ9oMoKX9LeHHWvXONnGJNLU1Y7sONOTgLM8DlW96NxuiN54J
 06CNwMtGWPtQQN7Pfw01kDxSXKZtdBCKZusRU7kvN+3jSKDo8ktJsKO1eU7yZdF1IZQ6jf0
 7W2IOSIzjYVYsWIGEMJEXE+GhG8A6LZxJWa1sa5o+AIZpZP/mYMqzMvrUHLws6FIgc5tSi+
 FVNMK88nF0wjs5AkXvXEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Swveffn1sWE=;KGZucvT+j0RsjpDn0bg/1V5oOsS
 Z09RPrBjvlr2ZXBntEa5Qx6W4rc0bCCwsmhK3WYiJOvrDXFmXDxNkHhmT/eEqHdZy5eyOhqp9
 ZJuTH3XRw7ZNmqHpTkj9+QcKAfaUqAIAG+CM4W0Wx5hhWy+Gzcl+HMsxqzbtkb4k1o31JbL9D
 LVBtX8VwbZHMkGAAGCrFKdYUQo9FXPg+Gp72p5dFsFwOJqermJmBwYsinqA26R7recM6XKonL
 /dg1ywD1rFlcqgjaZtceDmWkXikopb8svmPPu04C9rX0r8plsjGulbvVX1HfTtg27gj5DeGDD
 iVDAi9Uu6XZNpbkODBKRgmPNNO19SCXkkbFZI9UHWRmioYyVZjQ2dYOUrjZnawHy/EI1CMdFy
 tsQqKXnIHyMqU+OVR/oQBBqKJRgEIShrIcxB21ExkhDLSBpV03g+AEV4YtKOD/oPVtrlQjHsf
 AQNF9uZQozo2Jqn7oiavZsXS3iFIajF3g/mGYL6gcLYPXDgxlodxHbdaMuWHIv/a7Rp2Lfbtf
 +0L+076GIL9W717WBIRY5zUKeGusgsixuAVesBpDRiadcg69wg5nqY0R1/TA/49WIz6zFOuue
 uJezsNRkuAqwRqaIp7bjZoqYC6T9t4KIOgUTI4ScLSbujmSnEgnyRUVgpxOOW2oyRQK54r5jW
 ikmTT11LFHS0pfccrVni8xcF+40ugDdzpVD6FO3e/xi0lI9rO7Z1ENx6tQqLw1yNZYRF6EdFu
 SsliDzRdyMNcC9HMsk3d78KjZGT/5KtlszKfpIs3wnHUl8tsjRmxtyEJovdJtsICVdj3WWjbB
 ZKZrtnlPBbLDfEFaQ9OBwfY9Oy90Iyr0A3k+lV42HyzLBFAqRC4myRH4n7UQcIDb5t8ja8xKR
 c2t1b/JfUMdvvyNZmd9VxPdVKBE+SFIGog7/WUVGKCHFxYBoEq7O7cCh0rBydZHUWjgj0EhYv
 DIqQO4vYXk70Nb3kPFlFzDsQwtbYLG+0EzAF67PHB+HAeCBMsIHLnraPsRaj6aNkZb8fSC7Af
 Q3mENYIjciF1d59/G2mQk+vQqPv2j3EnR33NXVVf2xqX/cFmeacPfBd/fEUIlVv/8QTP92pG4
 kH7MORdAoIffkGon9iJsdQbJw1J4qMJXPRRRxs5R2s7ROnVnQCcjTNXlLbbMunpOpwAwpuzS/
 OhqWnr95A2uVzkQxbG52zprTzbyred4n/1EHpt8TDteQMYdTz1Ufo8yi+5w72HtztTuziffta
 G3s7fok9gWo4RPr87xOryJZsdfOde6JdGcNjdX3OiOcxmKVr/C2WSKcFFiqLmCEl9EWYDXqYc
 M73jmc54jiBW/XInytSDdwoXqcmltop0uI8ennQogqhNx622uy/SGwr6DkBYAf571Vh8P1WST
 QWv+gnOBHKgrWYh/4q8sjTxrw4fcPxGyb0Co37hGXXQ/hb4tb1ijQ77UJtI8q26ldntv9dnd3
 pEDk8JZtMOmam4NLz9018FnyMdecsM0M1phY7sghXoiNHnGwAGiwfksUbtzBUtHDfcS+3Yxud
 Hp9DumpuwQWFowY9dOdFpY6U4zwsHA0i4/fM8wtwOyj6vN9Ly1ulfberFkI4WyFrCIUCmvT0s
 /NVsC5ZyKAzEJnUZJpBPdt86cCqPJEgsWACI2tEIr2dlqL5N14PGaamR7k5ydBQAFfW1o/Oqp
 noSIEVtdSW1SmwlSBAF0/whql6YEdt7NhpxZpDO163sBO/QDVOXf+yxIajUYGF9iiq7Twf7Ra
 yxGEjlH0x82eNmjLNzl7Zga+v9EzHEYHcj3HtZDlLj3FqH9SbUNeqRd6pd296rnhq8qH6mWr/
 /hCq7YpzR1MWD9asRoBGmJ/S+U0eIQOXvTiLk2PvfhtVhz2qy3+S3oTgqar8w9BIeikgOnkQt
 WKPVxg/bNOiW6dkU4PbFhJgx0rYbODE6X3xYBcj21AGf7q9ICTF3sDk/k0OFymeMRy8ctbdnv
 tUqzzVBseFnrAH8wnqHk/cmvts7TYZqBr7a+Om1UVlrmB8FxLydiMfk3rw0suj467HRBtg9IB
 6xcsursa+elai4HUlX4LwBSWtuc3QJxP8zxeJvxMVvt7THJC7hx+IuGmwZAafjLjK2fn7wRti
 0nnR5pr7iP4zi2it6XZeRvmFpyBArd+cONkzEjKgRs0AVK+qEFMc1cOgyqmz8bw0ZoREeSNbc
 dlCWAtb4D4gSVekifUR+uUjgIjLmwVSnn4V7POu2JyFpFZavroO5fiW/KsIBDVvaYtgPxaKvr
 xv2t3zSCIdrskbRWSUvzdmumm4trjWhRGBXh/qSPF1wc9axW/1x9YzzRUCQA5diIteMxzDBZJ
 48oqdgUGNzUhicyHIc35EAhAWzbaHBV5ZcDkli4lrvjEWKBITwgprFkbcTeWHkGRIAd45amq0
 ejcvB8flVs/oVwp/d4gx5Y9fguYrPx0s9ZQu0elzTu9nqyWk8nLG/n/yVc9kVB/PYo0ATfEMt
 5Yi6N3k0VK98fUrTn5b3szopHAq7JdiHQDXEMRM8r0TkEUXi9ocfq0bPt6rFrMzvXKJxZIQU9
 GGakgJ9syaT7W3+3YEnFaqNuldF4cxSQZ7ZdmZYW6tTqxZquQ6kR+y8sqeNxrU4MS2FpHDFN5
 GP5Prz2+94bURvfgunbOQAbtNqCpowBCDJv1WHBJ1xk9g4irE/3HzpVNuDW3GBO7X6sGqXLPx
 zIj1a2NeZZFsiZcFxdayQlAkVO+8X8nlHAw+2Igd5IiZIC0KYWPL4MXVa9p7lJ6gW72bGNrE8
 5lRhzFn471kSVxEff/DKc8OG+vqDRTMPZ3DdqJF+Fag61J3qkFYe/XL7TebHNCQMyMRU8Ez75
 +3fXNGLYv/pBdD/7W62ozVqvn6ocOdSb+V36Ds5Uwts4G8lWzW4PXLHiGMAU9ziTJ3Z3KnNQG
 gSqWot0o4S+Q2zq79zVzRQo+tg50QWdOWQgOOPr/3c6PHncVHPXTw1jab8zYIze7rmk9qdBCH
 GIcCUo/NdpMHUBQJnI1XYFt9K+126eGvICSpkDRtVST0abAOYpGf1fjsiSKKMDLIaqDzkHtIi
 hNJMcidHVkq/TeoqBWBsc+FVSkNkksZMwnVDoPf10oNhaZnPADghm6ZTLlT98AKZ8/dDiT5xP
 ctEfrFQ6mwn0Uky1wNllhXx3ctJocSgwdYxyUg0mjJjNN8Np/0qFTCeissbXQRPOvCGjwhP5S
 vZRLKN995IQgTU+NkLl2HbHL/AZS4SHe7mfwUSKQCK3bny4lpveYHe9N08B+SFJPkYNy4fTqw
 Mag/LzXblhFGvDm++CbAfS4g+XSHSDIgFHwwtvOx98Mh2pn9Q05UjWnMALb0rntHnKCTyuN9l
 p2XTayIcZNAWIm5vJE1IAZbNHZpGX0qSA5QXChQzEj/7sH0DWDjI/cWPT8NkABArR6hgAKWtI
 1g3G9N9Keb1Lxl3kTej7BeHScghxOT29mQ9aiHuK8wtyvS1tI2haNjRLM3p4DJR0nv1L/ty0h
 bQ73DfORVuGWuHQGvjCsTV1w5GrEM31MSTJxQB7IwDxNS1X8QJig7nzZirZqNpk+nXTm3gwnN
 w5gZ+qi5RJQjVSg7sujgzrfiW/0cpvabIbgg+n2/ygHiUka0dqio0bsA8Sywed6MICTvhN3em
 h7GqsW4hXlwF/IoszGisWRn2NloH6j++2Jnkgxffri3WalEjlp66DPZHe2dwyOeRR2KA2i1nJ
 FsgAenGsTOj16JnvziKnfzLS4wjxbujGVCs3OF/MC3XfyUaSVOdhs5E2kK3ibg+uLvvWCKsc3
 2rjE7yiqcGQcXcThk2S6SGRU7AYh0z4CkLkdyCNXwj2TTz0YMKgt6zsElVhSnuFkBTOtp8u+v
 tHoA2o/03f3yt8PVoh0IelqZbe03CLLAYMx8vTV1qPG2rdVgFPy6rsh0s92XtUUky/Z4zuBRh
 Yfs2bM8KkPpkJNanhn32cWtKlgSyAwc0YbPygGOMElicb8dHmw3EVRZ4OucyQD1/GF05jfkRV
 HLikRsLcE7CFRdkgUaNj/HL35v+MLC/QqXvf8kZ0b0yF9GKMsT++cT5NMopIA8jOZPfLu1dm/
 WCBfDD9NSUWb3908z38XmB7up5Jc/4NlOMPT/1WpTtB7NIug43rAMfYGBGnZSihT/1bwaeQR7
 IFfQHkrZ6RrpRYnFMunXZG4JOrUThPRnmTHHWZ2e7LSIeA6fSQJrMC9ha25OKKyXQaKhOgmSO
 0grSrNDRGLvA7roKXxLbdj5zn4AwnkHkKRl29pxb5OCPP6ZnupljVCnc7GtRTKtstpO42D/aO
 TWBxRhWVJXit+jK3MeYjLS2fq7bMveV0euZn9iJQR+tAhleqwtmod2d+ssjsmwTQMdHU2LdhC
 p+9NF7I5YhMzK2G/4YffdX59UyP35DLcWOQQ1ZG+FrIxwz9NoCkZzak6flgZD8ToQ1+S55M03
 RQvVGqisjU7uwcZTwEMZRM80HcKG7qhvQdD257LgfbNn4+v2J8tgKMzvwmtTuYQ+5X2g3XyaX
 I/VRYCdMmoQnv5ygw+ZTfbx03emKy/d/g6REjFcgqQId0GX/NNdcIH3pDfIzIX4Kk714gA9Ra
 M6XMhnsUVZHSOYQ51KA5G7ppcOpi8qcj88pgFpPI+ENWg4EAhWp2OEBnY+sCiXgteN5rav1mm
 IeMAILs9HUmEasBBDM6v6pqcg6wtA+bLX3eazIKZ5NfisW0ODZ8SKmcxa99LdJVUodkhxkmyz
 woQywJYYB6R1+uA/0UEtQyumS55n/MW2t/Afc48QxJzKHK7L1z6aikbmgTE6X4+WrC+CdwM=
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

Please choose a more appropriate patch subject.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc4#n638


> Move the of_parse_phandle() call after devm_kzalloc() and add the missing
> of_node_put() call immediately after of_address_to_resource() to properly
> release the device node reference.

How do you think about to increase the application of scope-based resource management?
https://elixir.bootlin.com/linux/v6.17-rc4/source/include/linux/of.h#L138


> Found via static analysis.

Which concrete software tools would be involved for this purpose?

Regards,
Markus

