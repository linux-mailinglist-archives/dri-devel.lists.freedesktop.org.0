Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 888F71ED738
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 22:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF5C89BCD;
	Wed,  3 Jun 2020 20:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0EE89BCD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 20:12:01 +0000 (UTC)
Received: from [192.168.1.164] ([37.4.249.202]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MyK5K-1ikVxz42Wq-00yktF; Wed, 03 Jun 2020 22:11:28 +0200
Subject: Re: [PATCH v3 105/105] ARM: dts: bcm2711: Enable the display pipeline
To: Maxime Ripard <maxime@cerno.tech>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <587d6e4a529a8d807a5c0bae583dd432d77064d6.1590594512.git-series.maxime@cerno.tech>
From: Stefan Wahren <stefan.wahren@i2se.com>
Autocrypt: addr=stefan.wahren@i2se.com; keydata=
 LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tClZlcnNpb246IEdudVBHIHYy
 CgptUUlOQkZ0NmdCTUJFQUN1Yi9wQmV2SHhidkplZnlaRzMySklObW4yYnNFUFgyNVY2ZmVq
 bXlZd21DR0tqRnRMCi9Eb1VNRVZIRHhDSjQ3Qk1YbzM0NGZIVjFDM0FudWRnTjFCZWhMb0J0
 TEh4bW5lQ3pnSDNLY1B0V1c3cHRqNEcKdEp2OUNRRFp5MjdTS29FUHh5YUk4Q0YweWdSeEpj
 NzJNOUk5d21zUFo1YlVIc0x1WVdNcVE3SmNSbVBzNkQ4ZwpCa2srOC95bmdFeU5FeHd4SnBS
 MXlsajVianhXREh5WVF2dUo1THpaS3VPOUxCM2xYVnNjNGJxWEVqYzZWRnVaCkZDQ2svc3lp
 by9ZaHNlOE4rUXN4N01RYWd6NHdLVWtRUWJmWGcxVnFrVG5BaXZYczQyVm5Ja211NWd6SXcv
 MHQKUkp2NTBGUmhIaHhweUtBSThCOG5oTjhRdng3TVZrUGM1dkRmZDN1R1lXNDdKUGhWUUJj
 VXdKd05rLzQ5RjllQQp2ZzJtdE1QRm5GT1JrV1VSdlArRzZGSmZtNitDdk92N1lmUDF1ZXdB
 aTRsbitKTzFnK2dqVklXbC9XSnB5MG5UCmlwZGZlSDlkSGtnU2lmUXVuWWN1Y2lzTXlvUmJG
 OTU1dENna0VZOUVNRWRZMXQ4aUdEaUNnWDZzNTBMSGJpM2sKNDUzdWFjcHhmUVhTYUF3UGtz
 bDhNa0NPc3YyZUVyNElOQ0hZUUR5WmljbEJ1dUNnOEVOYlI2QUdWdFpTUGNRYgplbnpTektS
 Wm9POUNhcUlEK2ZhdkxpQi9kaHptSEErOWJnSWhtWGZ2WFJMRFp6ZThwbzFkeXQzRTFzaFhp
 ZGRaClBBOE51SlZ6RUl0MmxtSTZWOHBaRHBuMjIxcmZLaml2UlFpYW9zNTRUZ1pqak1ZSTdu
 bko3ZTZ4endBUkFRQUIKdENCVGRHVm1ZVzRnVjJGb2NtVnVJRHgzWVdoeVpXNXpkRUJuYlhn
 dWJtVjBQb2tDTndRVEFRZ0FJUVVDWElkYwo0Z0liQXdVTENRZ0hBZ1lWQ0FrS0N3SUVGZ0lE
 QVFJZUFRSVhnQUFLQ1JDVWdld1BFWkR5MjFPVEQvOUdpWkxkCnRSWWNteVJKZ2x0aVFRekFp
 UWRjSUQ3OGxHb1dwL3grci92Y1U2YjZqdVl1ZVR3Z1Iwclc3djdsMklSQnlEN24KSEp4YSt0
 SVNvUVpCZ2hvbE1JZmI5TXRoR09KTENZNzdrL1FoQWhuMzJOR1prZWp3OXR6a3MvNDBtclpT
 VVQ4NApaeWJzUVhyTE0vSFI2VElJL0RlUEIwbktEM0ppcHBzMlVIUUQ5cUQySWpFd1NRUGxI
 akNPckVaaDQ1UFo3bTkrClo5M0x6aVRlc1dabFlRdUxpSndzNHJLcHRIVzFkL3dSZWxzaG1t
 NlFxY0wybDRDL2U0MGVEQjlncTRkU1poOVgKUEVZbGxpeU5RaDdhMkxTZHVtRTFyK2NTd0lq
 RS91ZHRSdmRPOWFLb0psT2JVSzVkTmpTUEg3d0tUYndkWGRZRApHUHdEaFhkNThOQXdyK1BY
 QmxQajB0STFMQ3ErTEJ4ZUt6aFdYK0dWcTlEb2pWanlVREV4Rk5Ga1h1b0M3ZzhtClY5VDB0
 ZUJpdVpSbm91WEt3VjJGcHRaT0hIN0JVRVd0a0t0aGgxZXRmT1dwaWdCemtVN2JQc2ZJWVQr
 cnk5dGIKMW9KK3Y0MVBOYXFaRW1QVXBKeHZmek5UN3Ayd01lRDdaajlmMHJ1YlJQdExBSjJR
 R2pyRkhzdVh3QU9xcHl6ZQoxOEVidHNZazBOMHp1SEVoY2orUEJJQmZoMFlJWWQ1MW9mNkdJ
 aU95UjlxMFhYdHBsVUo3VDIvSDF1UXFrWGxwCitnVzRWa2lmc2NJckl1eWZueFpXMTJlSXZq
 NnlicVdMN2FZS0dZbVQ2aUxDUGJIWXlZY2F5bDRFa0ZjckNGN0UKZTBXVC9zY1ZNaE8vNVgv
 SGFOQTVIQngvcjUycGdMY3Y0aTlNeExRbVUzUmxabUZ1SUZkaGFISmxiaUE4YzNSbApabUZ1
 TG5kaGFISmxia0JwTW5ObExtTnZiVDZKQWpnRUV3RUNBQ0lGQWx0NmdCTUNHd01HQ3drSUJ3
 TUNCaFVJCkFna0tDd1FXQWdNQkFoNEJBaGVBQUFvSkVKU0I3QThSa1BMYmpic1AvamdqYVNz
 NUh0bGtBSXZXUytGcm15N2MKaG5jT0F4TFRWL0Q2UkV3SU95R0poRkt3d29pck55UTJnOXZV
 YTNZQ1lDZjFmSjh3RWhhS09COWQwTHBNUm5MNApkRVQ4ZDgyMzhFL3BLK0hxTktpSXNKaHM2
 SnNLOFpnalZRR3JtbWZua0dyWisxdjBIQnV4ZGljZ0duUC9XdHVBClVsOGw2Mi9BTGJheXlq
 KzYxQ2xyc0V0UklhcU82N0xJWXdQaVBEUkkrWGlNek5pR3pIRi8xUTZHUjAyUkg2YTMKRjg5
 ejhhUHhjSGkxWnZDdDJ5a3o2VUVjaHpQMHI1Z3FGSisvTC9VcHU4ME1YaVk0djVlSWFCNTJn
 VlBnaXlNQQpsTDJkRHMxbUladm5yUkxSWTJ0YjNtQVlOa1Y1QjVJRFQzcGtXeTZrS281T0Nn
 SytZZFlPUjhGTloyb04ydDhPCnJLK1ZudGFLN01NU0tIbG1ZL3NPd3RSbEVoMU9CbXJjQ3dH
 d21wLzA1R2tSNDZmL0lzaFJWZUZPUmF3K0dBcXQKUDIrQ0ZhMkNOQS9JSG5aTm95aWtsRHpQ
 UUhVVUdzck5wcERyaFg5Sm1oQm1nMXYyeXdIMU5YdTFpRGZQMUJBdwpLZ29rdDVmNVVhUkY5
 c0FBNTN2V0V2YlVVTjllZXNGR0x6UFdkSkdRNWhwZC9WSDVJUXk5U0JyaC93SWNla3E1Cm4w
 a042cGJUSHhHRTUyU2kvTVZJa05UdURaM2FwbjJqbERaNHBPdHBCWEkydlAzYlBPK05pcUJa
 anNVM3R4TGkKV2R2MkZqeXp6NlhMUndlV1JZVkw1SGE2TER0eG9yMnZ1NlVQMDdwOXh6MXhS
 WmFPRFczb1lsSEZ6WXBhNFc1ZwpMSGIybEVrSXVVZlNjaWNHYmpqQXRDbFRkR1ZtWVc0Z1Yy
 Rm9jbVZ1SUR4emRHVm1ZVzR1ZDJGb2NtVnVRR2x1CkxYUmxZMmd1WTI5dFBva0NOd1FUQVFn
 QUlRVUNYSWRlaHdJYkF3VUxDUWdIQWdZVkNBa0tDd0lFRmdJREFRSWUKQVFJWGdBQUtDUkNV
 Z2V3UEVaRHkyeUhURC85VUY3UWxEa0d4elE3QWFDSTZOOTVpUWY4LzFvU1VhRE51Mlk2SQpL
 K0R6UXBiMVRiVE9yM1ZKd3dZOGEzT1d6NU5MU09MTVdlVnh0K29zTW1sUUlHdWJEM09EWko4
 aXpQbEcvSnJOCnQ1elNkbU41SUE1ZjNlc1dXUVZLdmdoWkFnVERxZHB2K1pIVzJFbXhuQUox
 dUxGWFhlUWQzVVpjQzVyMy9nL3YKU2FNbzl4ZWszSjVtTnVEbTcxbEVXc0FzL0JBY0ZjK3lu
 TGh4d0JXQld3c3Z3UjhiSHRKNURPTVd2YUt1RHNrcApJR0ZVZS9LYjJCK2pyYXZRM1RuNnMv
 SHFKTTBjZXhTSHo1cGUrMHNHdlArdDlKNzIzNEJGUXdlRkV4cmlleThVCkl4T3I0WEFiYWFi
 U3J5WW5VL3pWSDlVMWkyQUlRWk1XSkFldkN2VmdRL1UrTmVSaFh1ZGU5WVVtRE1EbzJzQjIK
 VkFGRUFxaUYyUVVIUEEybThhN0VPM3lmTDRyTWswaUh6TElLdmg2L3JIOFFDWThpM1h4VE5M
 OWlDTHpCV3UvTgpPbkNBYlMremx2TFphaVNNaDVFZnV4VHR2NFBsVmRFamY2MlArWkhJRDE2
 Z1VEd0VtYXpMQU1yeDY2NmpINWt1ClVDVFZ5bWJMMFR2Qis2TDZBUmw4QU55TTRBRG1rV2tw
 eU0yMmtDdUlTWUFFZlFSM3VXWFo5WWd4YVBNcWJWK3cKQnJoSmc0SGFONkM2eFRxR3YzcjRC
 MmFxYjc3L0NWb1JKMVo5Y3BIQ3dpT3pJYUFtdnl6UFU2TXhDRFhaOEZnWQpsVDR2MjNHNWlt
 SlAyemdYNXMrRjZBQ1VKOVVRUEQwdVRmK0o5RGEycitza2gvc1dPbloreWNvSE5CUXZvY1pF
 Ck5BSFFmN2tDRFFSYmVvQVRBUkFBMkhkMGZzRFZLNzJSTFNESGJ5ME9oZ0RjRGxWQk0yTSto
 WVlwTzNmWDFyKysKc2hpcVBLQ0hWQXNRNWJ4ZTdIbUppbUhhNEtLWXMya3YvbWx0L0NhdUNK
 Ly9wbWN5Y0JNN0d2d25Lem11WHp1QQpHbVZUWkM2V1I1TGtha0ZydEhPelZtc0VHcE52NVJj
 OWw2SFlGcExrYlNrVmk1U1BRWkp5K0VNZ01DRmdqclpmClZGNnlvdHdFMWFmN0hOdE1oTlBh
 TEROMW9VS0Y1aitSeVJnNWl3SnVDRGtuSGp3QlFWNHBndzIvNXZTOEE3WlEKdjJNYlcvVExF
 eXBLWGlmNzhJaGdBelh0RTJYck0xbi9vNlpINzFvUkZGS096NDJsRmR6ZHJTWDBZc3FYZ0hD
 WAo1Z0l0TGZxemoxcHNNYTlvMWVpTlRFbTFkVlFyVHFueXMwbDE4b2FsUk5zd1lsUW1uWUJ3
 cHdDa2FUSExNSHdLCmZHQmJvNWRMUEVzaHRWb3dJNm5zZ3FMVHlRSG1xSFlxVVpZSXBpZ21t
 QzNTd0JXWTFWNmZmVUVta3FwQUFDRW4KTDQvZ1Vnbjd5US81ZDBzZXFuQXEycFNCSE1VVW9D
 Y1R6RVFVV1ZraUR2M1JrN2hURm1oVHNNcTc4eHYyWFJzWApNUjZ5UWhTVFBGWkNZRFVFeEVs
 RXNTbzlGV0hXcjZ6SHlZY2M4cURMRnZHOUZQaG1RdVQyczlCbHg2Z0kzMjNHCm5FcTFsd1dQ
 SlZ6UDRqUWtKS0lBWHdGcHYrVzhDV0xxekRXT3ZkbHJEYVRhVk1zY0ZUZUg1VzZVcHJsNjVq
 cUYKUUdNcGNSR0NzOEdDVVcxM0gwSXlPdFF0d1dYQTRueStTTDgxcHZpQW1hU1hVOGxhS2FS
 dTkxVk9WYUY5ZjRzQQpFUUVBQVlrQ0h3UVlBUUlBQ1FVQ1czcUFFd0liREFBS0NSQ1VnZXdQ
 RVpEeTIrb1hELzljSEhSa0JaT2ZrbVNxCjE0U3Z4MDYyUHRVMEtWNDcwVFNucC9qV29ZSm5L
 SXczRzBtWElSZ3J0SDJkUHdwSWdWanNZeVJTVk1LbVNwdDUKWnJEZjlOdFRiTldnazhWb0xl
 WnpZRW8rSjNvUHFGclRNczNhWVl2N2U0K0pLNjk1WW5tUSttT0Q5bmlhOTE1dApyNUFaajk1
 VWZTVGx5VW15aWMxZDhvdnNmMWZQN1hDVVZSRmNSamZOZkRGMW9ML3BEZ01QNUdaMk93YVRl
 am15CkN1SGpNOElSMUNpYXZCcFlEbUJuVFlrN1B0aHk2YXRXdllsMGZ5L0NxYWpUS3N4Nytw
 OXh6aXU4WmZWWCtpS0IKQ2MrSGUrRURFZEdJRGh2TlovSVFIZk9CMlBVWFdHUytzOUZOVHhy
 L0E2bkxHWG5BOVk2dzkzaVBkWUl3eFM3SwpYTG9LSmVlMTBEamx6c1lzUmZsRk9XMFpPaVNp
 aElDWGlRVjF1cU02dHpGRzlndFJjaXVzNVVBdGhXYU8xT3dVClNDUW1mQ09tNGZ2TUlKSUE5
 cnh0b1M2T3FSUWNpRjNjcm1vMHJKQ3ROMmF3WmZnaThYRWlmN2Q2aGp2MEVLTTkKWFpvaUFa
 WVpEKy9pTG01VGFLV042b0dJdGkwVmpKdjhaWk9aT2ZDYjZ2cUZJa0pXK2FPdTRvclRMRk16
 MjhhbwpVM1F5V3BOQzhGRm1kWXNWdWE4czZnTjFOSWE2eTNxYS9aQjhiQS9pa3k1OUFFejRp
 RElScmdVek1FZzhBazdUCmZtMUtpWWVpVHRCRENvMjVCdlhqYnFzeXhrUUQxbmtSbTZGQVZ6
 RXVPUEllOEp1cVcyeEQ5aXhHWXZqVTVoa1IKZ0pwM2dQNWIrY25HM0xQcXF1UTJFNmdvS1VN
 TEFia0NEUVJiZmw5REFSQUFzRExjYStMbFAydm5mdEVHaHBjQQpCR1ZOUUVGbkdQckNhdVU2
 SGhOODA1V3RQVHRtc1JPdUp6cWdVVDBtcHFXSWZacTZzTXd5dkhLOVRzL0tIM0paClVWYlJD
 M3oyaDNLZmhIL0RhZjk1cGQ2bVBjL2g5dkYvT3kzK2VUV2hnR25QNmNBNWtsUitmTzFXaEc4
 VnJpWHYKck5lUkcyMHN6emplSG9jblNJY1Q1WHVaUjB1REhPaUd4T2l6MXNNUkZUR3h6R095
 MTlSOXJ2dTYzdGlJM2Q3dgpnYzc1T0NBZGtlQi9TZUNFbGFSdzBUZjdMWmJQampzRjI2M0JZ
 bk1mNGtrTkVLdnFXY1UyaWNNcCtxZXpqeW5CCnB2ZXVlMHJDVFFCWUFRbG9GQ1ZUR0hyV1dB
 NkQ0VzVPMkFmSWRJYzF1MUpDWnAyZjVMV1ZvVUZUVklyUW5RUVUKU0hDaWZyOU1aeExUdFBK
 ZFU1Mm9TUHczZGs0aExQOGlKSUx1dnYvYXZhakNzUVlIRXR3WXNiZUZaeGl1TGdscApBN1lj
 Sk5ObXBnQ3BNRDR3VWh2bEN0QUtOQlFXeXIyOTc2OThFUVRuNDZlQmVVNkttMkNpaFhrZ3dD
 eWY4ZXlLCkxFM3NYZXdhcTVrZ1pXdk5xNml1NXFZSVJCOXl3K2NYYzYwZE9aRE9scTkzWDVT
 QVJZemFvZXBrSHo0cmtMa1AKUG8rdENIeUhRUHNHblBYYzlXVDgwREM5Tm5KR2R2VWx5NXJk
 TUk0eHBaeWdlb2tqd293VlFsUFV1Y1M2TXluNwpmOHc4Y2dmQjdDMklBSWNEeDJwUC9IendY
 dmtDT1FOQTdtVjFsTTA4bitnVmtUcnpweGlwNURicTRDSW9ZeDJNCkpaVDhiR1JINlhqY1VE
 S2EwOVFoeVpzQUVRRUFBWWtFUkFRWUFRZ0FEd1VDVzM1ZlF3SWJBZ1VKQThKbkFBSXAKQ1JD
 VWdld1BFWkR5MjhGZElBUVpBUWdBQmdVQ1czNWZRd0FLQ1JCVnhETFBjVk1NamNkc0QvMFJo
 QXN1UVlPeQpyMTNCbDNOaFhrWUFaR3AyWkZER3VrZTdPU2tWOG9qT09UZFR5ei9jT1JHQ2J5
 ZEQrRGd2cUZ5VmRuT1hLZ08wCmxKbUd3ckdlTGRnZ0F2aDBpaHJwNU8wWVVKOWJCU1htR01t
 UVRZSC9BbUxUR2FkYnVqQ1dqNWZGVWtDeXd4aW0KSHV5MFBiMjRwelR2UzUwR1k1WStxSDBG
 SE5haWdka2tpV04zcnVnN0haRXUvQ3lsUFpqT1h6K0QxUVBNckV4dwo3ZC9NS2FiVis5YU5i
 UVlabGRJajk4UXd2VUYxS1N6YThqbFVJdnBoUnEyN0FUOGZER1lHUGZERU1nMmNCT2FlCkty
 N29uUXM0YjdhV082aWZEbHhRVHB6c3pvK0FuODA3Tk1TdFZFRmYrczNBaFZEM2U3bmY4SkJh
 dmJWckFlMGsKb20yNm96elBubnh6K2xxVlZ0dzZVazRYTUl6dGl4L0h3SFl3dUNuY1VYWndL
 MEkzeUFKd2pZd29vck9DaEozUwpFVWJKUVB0R3NneFJERXhWQkZlNk5MUC82MnhQOU82dGFj
 d09kYjBNbVAxYjM5cFJBVEM3YmdkMWxkVUxpNzVaCmxKckowL1NpVkVyb3FOWXk3OXRmbWdB
 WjJVeFptczlTckV5Nm85UVNmc24xYVh2K01QTDlKYUNHbWtQNnpiTFEKTm5kajBKY2FRbmtD
 MHZneWRPMUJtNk11OTZQOXVmbEtaY0FTNndtTE01SWRIT3lqTDg4d0h3anVjakFPQnRjdwpw
 MG9HVG5WT25Sc05ZU084VzhZWi9LZGJ1Nzg1ZGF6TXFKMmlOakFEdUJiZG02TjRqNUVkTW5r
 TG4wQklmUEpwCmRnbTR2bDJVcExqd1JHci9NM3dtbTVwdnMrNnVCN2hrL0ZKaUQvNGxsRU5Q
 NGVNMWg3U200aitWcTZOMSt6VEIKSVhKQWViSXFhc0RwNXlaUzdYcnk0STM2bjg1WEVZZkcw
 MWx0QXlob05WMkRPOFNJUlFwdWkydHErOVJQM1JLMQpKREJ4eEVKWTJFTzVKWjhNeGFQSFEw
 RFQwNWxSRmpLMkFsaGRFSXRqTGpwSjNmVW05c3FMeE1XeHpQNlV6M2lpCjJ1YTR1bnJ0Nk9D
 VHFRd2lqRi8zYlRXaXd2VkFBSG5NRlVpb1hzaEhhb2hWRGNWZm5lSU1mVjBiUUNYWWkzTnAK
 WTB2MFp3Y2lGSCtnU0M3cUQ2WE51aHBWR1NMNElpbGlGeS9TemNhSkV6QUhlTERTaFpQMkNX
 ZG5DNHZnbDM3dApocHg4aDU1WWhKbjZIU3VVelBnaGFLdFZCMmsrajdaZXlaK1NGeHA3SXVi
 SEN3TEhsUWhUNzVSd1EzaUF4S242CjBxajUxY1lUbnF4ZFpYVzZmSDNQa3VNellVNUdwcVIv
 MU9sNWMvd2ZJNmc2QW04eUtXLzBFVUx0K0tuNExGc1MKbTdZM201SDV2MTJVNkpCWXZWK3Ix
 M2paaW9zNEVFREU5M0Q1c05IMk1JeVJ6Q0RxMXpkZHQ0WHV5S0ZqUEtXMQo5aWJaRGZGVjdL
 dUNzdnVMMjNzQmMxc0NNb3ArRTFtVC9ReE9JQTZvRFQxTVFzdHdPVnVReURDdi9PdktTZ2Z6
 CjhGWEdMNkFQY2xqQ3FqOEFKaHhReXN4ZG9pUVA4bS92dStialdHR3Z4dzVzMWxncGlSRFRS
 VVBnY0pKTmFHWTIKVklEclpRaTROU2lOUTBOSWkrZGp1NGZOTW1DcFFxZzh0YkMzY0FhNnl3
 bTZvUUIxU0JobURYMmUxMWdSbGx1SQpPblRHUEUwSFRvM2w3MmxoYmc9PQo9cVpNVgotLS0t
 LUVORCBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCg==
Message-ID: <cbfeb8cf-ed56-bba9-6067-ca0206d54573@i2se.com>
Date: Wed, 3 Jun 2020 22:11:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <587d6e4a529a8d807a5c0bae583dd432d77064d6.1590594512.git-series.maxime@cerno.tech>
Content-Language: en-US
X-Provags-ID: V03:K1:9eaud/WWCAeoi/8fKX9wOB4syrwwNtj7/Dikv4S6MAmei5SHuSK
 Fvq1MAsdbaKUADXSKuIaykePLmxTd1ZYQ3j908KRPwEqyiT61Da5aleRrDI0t3BTV6NDmB4
 G/qjoc2XNa69D0mmWeaLhfFv/2MCT5coLpdJQjHySdcQUON4g/eBhe+FBdsb5mMYlMBkwH7
 alWKeI33cOCk66BoT2zmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5J9sq1+Gvkg=:4/LckhcHbECw3d426rroNH
 uUYHlrZ32g0q7oofc3oqFG5EHEtAnrnhBrVyVkSrOGdUyXCgrukfwXy09GlX7b4/3tryhiPAx
 v5flSRkvWvwhLSajUf1O3aX41NWeqPA8wknDWzbusd3RgEYRoQu8epH4VwPTBtrC9/75DiU4j
 NcSJguIVrCcLeFTmLJF4r/JfMUfHr5QDr5QBjhWMN5N2Vn7C0y6ix1pYO2SQQaDXDNJsG+Quh
 djUnx3ktQtirTEZZLOPE7RsiqYX4VSk2kDNdPs3l9nrS14rGQPPF2l7EoE5G2EQ6Bss6f2Q55
 rbE9987iuaN2HDauffJdImazpAz4wnLty6xWL/6kOS3a4v39oQ0SNeOnRNPEekImrCUcUN4CY
 lQFELPNYUsyp8v1rHnpqugDCHXo3IwRlqH/9vNMKHgi/SRr5xnDyCtPIFx6OD1NOTF+ZlYi+x
 RyCPvz64J8QesglfNy9EQixS2O0ZMgDQY1Ii34Popgode5qqwJwn7Kdhz9e+L/x50PsKiyBbe
 KSKTk4oue82dfbnpg88/C/kq/ivfRsRcOZVhKRq7n4Y1QEiPZltELeBmI+QGEJSwStKq5BbiL
 m47LRG5dPIJB2tQoBZxN6wXQkcgA97K3fWfS4vKztmUYsu5zosiO7yJIkqk0YODiFrcrqnFun
 ZLUZwmFf3YupVM3NjVf3WTMij+vzDWTudlVJDBTsc3GC89RERlK/dLzSnRBYY3XwEW9mYg6hW
 c+W94V/DnP4z+40aSugMI9SVle2uSIZD1s00Lkxj/iKly/Dtu2G/fSykApHYwSJ5qbQ7wOh60
 sv4WVyG6Umwz5ZjTMvYTx0AyE0GnVyEf+a+ihRC+b/jsHvQQh8Fu3HNx+C5iDPX1/1HM8WH
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Am 27.05.20 um 17:49 schrieb Maxime Ripard:
> Now that all the drivers have been adjusted for it, let's bring in the
> necessary device tree changes.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  arch/arm/boot/dts/bcm2711-rpi-4-b.dts |  46 +++++++++++-
>  arch/arm/boot/dts/bcm2711.dtsi        | 115 ++++++++++++++++++++++++++-
>  2 files changed, 160 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> index 222d7825e1ab..c4a650ea4e21 100644
> --- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> +++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> @@ -231,3 +231,49 @@
>  &vchiq {
>  	interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
>  };
> +
> +&vc4 {
> +	status = "okay";
> +};
> +
> +&pixelvalve0 {
> +	status = "okay";
> +};
> +
> +&pixelvalve1 {
> +	status = "okay";
> +};
> +
> +&pixelvalve2 {
> +	status = "okay";
> +};
> +
> +&pixelvalve4 {
> +	status = "okay";
> +};
> +
> +&vec {
> +	status = "disabled";
> +};
> +
> +&hdmi0 {
> +	clocks = <&firmware_clocks 13>, <&dvp 0>;
> +	status = "okay";
> +};
> +
> +&ddc0 {
> +	status = "okay";
> +};
> +
> +&hdmi1 {
> +	clocks = <&firmware_clocks 13>, <&dvp 1>;
> +	status = "okay";
> +};
> +
> +&ddc1 {
> +	status = "okay";
> +};
> +
> +&hvs {
> +	clocks = <&firmware_clocks 4>;
> +};

it would be nice to have these references in alphabetical order.

Regards

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
