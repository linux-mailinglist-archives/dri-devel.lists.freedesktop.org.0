Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44050D1FFDD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 16:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF36110E1F8;
	Wed, 14 Jan 2026 15:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="Q8Gv1l+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D05210E1F8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 15:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1768406184; x=1769010984; i=markus.elfring@web.de;
 bh=29a7g00VV5oIMgcPIIXbUmKffyrVQzVif3rgoF/F7J8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Q8Gv1l+krWN9a4Nd0EkJcVR9kjWM56wrTdwFyts44//Pu0p1KDyg29CDnpO+hWfY
 N1F8wlN1a4AXa8IPHISsMbjn98usATVXdYeM94ZM8OzG8fyQg6KX8pP5pP6kJiIud
 szLj6FIuE8bWcvQ0vRYRCQFqclx7SvnleAXOUnxVjd/K/5ZH5IcVPYmeoGGkCtxpJ
 SZl1gGkocnR18Dy/SFKizxP0GPGswshqL9bkotbbD0a9NE6wwg1TnRdO3SKWXHDIl
 8kq0OUPRDJz9dBf6ApK97ST1Osgltz97lMNu9ooztanhCM2fPtP9m8umO9XqsI2ui
 J+XUkAq7/s6p1KCCtQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.218]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MeDQZ-1wDBWS2uRj-00gGQO; Wed, 14
 Jan 2026 16:56:23 +0100
Message-ID: <cfba57a6-01c1-4f47-80e2-9db4d5013986@web.de>
Date: Wed, 14 Jan 2026 16:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org
Cc: LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
 Andrei Aldea <a-aldea@ti.com>, "Andrew F. Davis" <afd@ti.com>,
 Chirag Shilwant <c-shilwant@ti.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Jonathan Humphreys <j-humphreys@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Nishanth Menon <nm@ti.com>,
 Oded Gabbay <ogabbay@kernel.org>, Randolph Sapp <rs@ti.com>,
 Rob Herring <robh@kernel.org>, Robert Nelson <robertcnelson@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Tero Kristo <kristo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20260114-thames-v2-3-e94a6636e050@tomeuvizoso.net>
Subject: Re: [PATCH v2 3/5] accel/thames: Add IOCTLs for BO creation and
 mapping
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260114-thames-v2-3-e94a6636e050@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BmEAR/B01vrMrlhj8U/EtTsWHSonlYX3lblnupw8ocrF3zNmFYt
 33KSzhEeErVmrm52rsnWfqU9TNbqIVICwFPaf1ZOA5Fh2qKl4/fN9fTLtesIVCtm0OSpNjT
 j/W3LSp6IRTw/QX4JOb0WvLA0hwh+d7VUvCrKHOD3fcmnlZa6xTuObr6RMjhLoCV0D/Y9ZN
 z7bTRmIp5ZBo5lvgW+2XQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uDWSF01tjIk=;RM3BOg6EJ72Ndu6h+DwIRZwQNey
 jCXkYs7iNgsDfieqLsD6JGGtP2zPdkbljb1X8EKp6OLa3M3IKuhDtmgTvM5QFYna7BEgvg//C
 MV6hCAwJ4xcjhX6vENHC1rOUHPwLwnDEZfZJYzTDpzlRbNfY8jQ9Ln19QYCzqnQSR9/EAaqcy
 705qYsILj/XsYkEu2JejNtc4zvqp80AviJ8NMvotBsNXHtbkKfANhN5DFlQr7YUur8UnGogYc
 uvCskCNF+9tG7tDrFSGUjjyrOAd9dne6m0X8aFLZLpHkjCn/LA/ma3vgOHXmACxY1/+e+AM8B
 N1PCysIzyJD9L1pLyM6CuAZEoLYeve/yaUp/SLH/4SkzAQ+ks6PsUWECVSosmIf2haHdHxNBU
 iwAJM2cbzGWu08xGRI2D36uLYsLP9SAbD0AZvriiYrKGZMwS/0KMTeeif8NEioPN6Ij77y0h9
 3jm7oB/kdBxDX+w5o6lRz3DFbDLh5n8MeXVj9XAU16olsWcvTZRmgjjLQOvb/vDa8SGQcHwTx
 IHJeyTdqEr8lcQd9iafXJVy1YHbaM6g+xb2jrUnxIB/z3L0XoZPbqV7zKJ1C+GW072EeoOiaa
 W3TWZfNYubltlY8tUeSuGaINFXQKhVvS7QvlqorKeE9l9cQJCN4QYlp2+O3G72OQFTczad+T7
 EqH/zun7RpzNY/4sVq4tLWhYLS0cI6Eb/flWpkCbpf27yu4iRptDQQ456q3t721nGwW4zJji6
 CjpPh0+xBtGBLJrxB5yVbN5tQ7r5EQexTtXeIaFpmr8z9NR2zt9ihY9H6AxL5YY2rGXEUSbpv
 nswOr6CShP8izPWC7Ghw8gOuiPtmP+y+rqBmjZcc+ynOO9HX6nJWLe+k6JyUzam06swCp4PuI
 f3BB6reuYamLdbYG3FzUFXyozEbMU3Ema94yIH61WFpA3Jjv9qVVMr5IdcOWRORK9217l0Eyt
 zKoWdqZbMylXnEWReyrBgC+gZYaq+LbchdPIqKDjBAj+1jEW6d+5F66/innwYyiILnFPsKNzg
 UG+rl0zB9mOBmNNgbrN/3z6WKwI3DymMFo/7JbbwvOVr9jjLRm4Y7w6/H2+tkSWfsg5Vcg0mb
 YQpSRWwZ3XrPO32ePu5SZkJcofNbRaRB8Aso59marGrXzdoeUc0b1y/2S8uzWBCS8Hx5lylvw
 ruG2GHk7ERpa4DDrHaob7DHJwb5llATrcvK0FleyMjck2UbkSmnvu1/1dBqOcYluCCK6aeG4F
 kk1YFFn3Nx8hfmHh8id59c0D9FJ7VHRcHdAINKxvbuBiU11Chg/sO4n6iz5DtQyz2GK3dRjQN
 gc96XbM5xeMXptHbt6HSHuS7dhsKpNXrGv/8k2PZmPcdca0cmLg5+AXMAaSVajqC+YrzB7KAq
 nd/D4aa1ET6ljz2K7Rjrn90dvouyWqHiRZO2o2JpuUtZPf4xzbdD8VbFj1itSoO77du38BtIH
 mJKiRQQkhW/y+Yt+JxLcOq6a+Z3H8j8b8+Lq0F15wYM1pr/ZBwJoZqToyql8IBemi/kCIZ9wG
 7b2RwInCoTXta678HuuzTBC8jyuKwfircBy+R8NX4TFXqBTGw1Ph94uBlXULZU6MVZg9yXpYZ
 SRBsI+Mf+/HFe+S+J/7WSosMVSqNZdvoJNkxoDWPhQVKppi43Qc3KNt8/0lsM0Opn1llOCehm
 F6Wg0XGXxXyNrWt5x6qNOQQUaSTNLznkunvDlfbSpyX1VPMhtpIEynAnm23Sx6xhxo5eTq+NY
 Y71e7opy1aXmtWyCnia83nLmA1/0fuRR3YOM+3Fn/6hrparDemC1o76//3tns42atslEeILbP
 LO9m6iKA6yF4ByrVrVoBGDj4YrlHfH3ZSMiqXk/Y20L5Kh178wgzLNDt1nRieX2lv2C9NYk5f
 sjW1KxL2OB0Y7E8IFooe+Ei2wRAfp0Pv9FANGtWkWY2BfUqSbUFt9FYWDFqAIOYweDJRV0jwO
 9iMAGvqdYRxofGv6PPRh+FwAIYQCu8aqLfRI+vy95umYS6rQKOt3y9RCYTrVMPv45012FRiZl
 ZMkVcM07B34E+dkt1gBAQjBN/HLHRHudUjhDNUwwde8QIPBKdK7jpS6bcEoFRLKzGcTBbv8O1
 KH723W7LAswwIc7eizi5xYD9v9XYZ6ZmQycMEsYRaLnH96tLAbHJKPsm8rJEXf2WZrEmYmf2R
 XM0X5I3UudgmytxtbhU7wjg9huY/WdVq/B2A3c49Onbz3Gq8X3MHWJropY+isFy51pfEVVrKE
 SWeg0b+IlDboZ9N/AIrFrIytOL8lIkTb2j9/JefiMH3JKhJ+C01GLcAbDkdX9xsP3k/415AOF
 KNy8pIEJhBzEzmpIKAknxcjGepsFpF9Whk1ugH0EyYw5v+X2+i0u51lWAG/9uOyKaIlpxiB6g
 VYYXTedO9moFDAoMTJ2FsCsORbtxR81FZyvUGdX6rI2rY0Z+HDB9x3y61Dqvkj5z304t0jvLF
 k6pbu4YRWOwgKUPNfecKnbxD4BwVSTRiJBV/eHW80xO12nxBbGa606qEvH9coguTz8KmvEYD1
 WbIROXbEzX+8E1GJyX/Cow3Ly7Vi7bwIxG6jwR1LaNgr65VmD2ry9gyR8ytPvWUfs/G3MYSIa
 Z6GWryyF+YagPbbQ19aMNojRf4F/QHF3Uj2DQ6KVPdBkREraVgUIDHh7CsO0ghJeaMoTa4mAL
 TUCu+nPHNJFswrX/BILAhq4HNK9IbcNN1APagxPt2QA0XnDUIjTo+qvtQtmlDokDh6k9Wfxgm
 00hSdWzyuF5cWAoQtUkeGwCzLsaFbw+ZIK5hGo5xedVP/lDCNcewSAW4iuDSxOYfB1Ii3sqqi
 fJbV6RVgFUdrFXwLfBKpiljWw1P6R68gEfpOZxkyxeYDs7n9UZ9J/lAqD/OqK6rEhswqesrQA
 xX3HcfzcIvCaABBbFCcIDkm6Z6mrxABC+1hhLF+xtDK8NrJ2amQKnvfUa7jLo8gOq0tawt6CZ
 1nHpN8Z6TCvtpESFyD0cSRgAfQI/FHXKZ+7h39vT9GYW/wWCR4nXukK8cspR/3r11DPaXKHwJ
 N4TQNjWZmHYIU15OkvDsWmueP6SETMu87flI90cZcZLbxGWTiD5IsLo/vFbeRl8LLktwbN5C8
 aJP2krXx26pSN4tEKJN9PvimDPXFmWujEEzEKYGDMSaTMj/D4UmXtQ7K3BETSGx69pxcQtoZg
 LMinYJrkyElKkGUQ3SIAJ0iga/6ROtPh6HnSKAQt9mvK3x0MVwjdBvTcg1Uykl7NnWkxT3S0W
 9Yt7gWXIztso3koUaFVhvhVtdQzqKtUwT+nvQW9GzDfKdwK63TKAXdXRUsCM558e1EglTjXyT
 YDYhjJob1deF/002KDpAGAOAvtOganJcyIZTkmcN8Ti/9Wx+bCsOEFQn2NaaEjKwrhozM+s1m
 DII2IecvPWT0HT6Wv1GQsN57qnUW+lYBagxIosAWlPRS+xghsBT+yNMucQR2X8ZXcZh6SVvOa
 qgeoe6LrdHtGNxqh0zKQbLaoVxF4gFOxMPH9fFz7EUPQzniiiUp9Ijb9anO+h1zZbHLF4vsLk
 ImpZ6y+r8CcvZMAumSfBURMvNdFee9EtSVoRvtIWjxcOP9KAxHeyH1wdv8HMgRCQjabnhlPEU
 /Bi7Hpk8xrHEwdvhqzRTJFTjGJ0W1TIbatjFFE9sm09Bpzp5s5z1UNEax8d2ZeVhYzGDqSa/c
 BUOUWrZboVVLvXg5e9c+t8QH2YmhTb+tdQJ5ToIPk/zxjGdGlLbaMy8RE6sVkRCzjIcs09Rs+
 rN5gHZRfPXl5akriOallzQTMgi79FQM8e7TPFMDdZpBRFhgKQuBKJu3wZxoRLPnLckp4I2x+M
 NgrAE0YO2DfB1Ah8B1ZM976YpJoBzpPp4JjhPwU13eMnJECnevy9nN/dL4wS723YG89PYQ7Rc
 SAZzDkoBslTTLrSXLBGp1nqQS6SDo/SKwNcWsOOnITGMzAaTLQZAhPQQ0dOYyUxiS+BcwGWNq
 Gni6DI3pV82kFWNWoHecAAMPHVg1KZeaS/UkEY7kulTSGl+AJES7lbFPvwLOPJlO464Jygo/A
 1yp51Hgd4cuvJlBIeDxVzsITHx57cgHzoT8FfPLGOKFB/Y7XUzqZuxZ+3ANRGdrNGSRHzXQFg
 FiIOS094kP6OJjkllZ0k2hMpJUYnpEpC3GxthtpG/0q06NC2KOtqtWKcEFQlYriMOyAs3W51o
 1f8mH+TiazqArfbexVT0ArJHbn0bUVOKmyIxLm753HqFroqPeX4ebIwFnL5cDKIydEEWhM/fE
 Fll4vKKPF5Q3f4xXu1o8J2WEENKJUluhnt55Hl7h0BtMZXpQYtgm4st+oU7OKtatHfgQBSFuH
 qFz/HuEp11kbpUB5E83u1QQsspq2MsNT3WUG1PsxU4FizwUg+xEszTFrPUcWQUjWTNXYeUTTs
 7Ptu81OUna9u+kFDZMQF41v7lvMGYbWuEvP4m6p6D6/UfngOqjftXwLVjJpUiJpaD7YBWzcZs
 Qw4T9yTMfFhedcJTGuLhoz+q9Hzr2lt30SQWrKc9CkHl21TbS/6tQ8cyB75/Lfnec4l0A4Byh
 tC/VvxZywjs+p6DxaXu2tVgvEcTs4XgeHtjZzwR8+5CkDnBxSbqaG6H8hZJ2c7rKw5RT2Qnex
 KK3WZUn3tiIh4NXzbg3CmcopKQr7FPoIcsa9cyUIFJYxnMVJnEQW1WGv5pXherajlTOUK9HaG
 kjrTjqX/fHKEgnNx+y+siDPetWtVdIIsIjeYmykXeX4yFN+ykjJMlJHtPk6t307q7628Cj1c9
 +58bjNozThTRyXJVIphLTuJNlf9Bmg50koY73A21kMfwdU+LxZoebauWQ/c1sEdvwfYU8MI3O
 lXDuH1SxxoqF2+eX0+JnsgymE1ETdCs0sFvNiDQNz4HJ44QJDwxudB0e0JCNeGEJELgbydkb2
 4MKydYd1lj03gXQ3CsrM5FcBFOsuur7mdrdgpv3fkGNhMvOqj/xfhbjkn1qCPLAqDBIxvV6TB
 T3aKv7typVnRUV5u6iR+bc28hBfleS2Aiovlfrb33ninhoV/e6QU5S2w2w8aMH1Hd1Gqv4JrB
 MKxdEYh9gHUXOnBbth2UwpxZ6d2zP43kaJdW2jailuP/Ax/Ve8upFP1CRxLE60+Asc/52stTd
 l2Fe7FtbDKk6eN/B9V8KD2JGVgjSR+7h4H9AItuKkvlT7nQeyybejcacyXvskUM8Rh+RvyWOd
 lkAuypJg=
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

=E2=80=A6
> Buffers belong to a context, which is used by the DSP to switch to the
> page table that mapped the buffers for the user of the job to execute.
>=20
> v2:
> - Add thames_accel.h UAPI header (Robert Nelson).

* Please move patch version descriptions behind the marker line.
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.19-rc5#n785

* See also once more:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.19-rc5#n94


=E2=80=A6
> +++ b/drivers/accel/thames/thames_gem.c
> @@ -0,0 +1,353 @@
=E2=80=A6
> +static void thames_free_vaddr(struct thames_device *tdev, struct thames=
_gem_object *bo)
> +{
=E2=80=A6
> +	mutex_lock(&tdev->mm_lock);
> +	drm_mm_remove_node(&bo->mm);
> +	mutex_unlock(&tdev->mm_lock);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&tdev->mm_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.19-rc5/source/include/linux/mutex.h#L2=
53

Regards,
Markus
