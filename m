Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B83F75A5DD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 07:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB2310E558;
	Thu, 20 Jul 2023 05:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB07F10E558
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 05:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1689832054; x=1690436854; i=deller@gmx.de;
 bh=/Bb2ropaPWrZgW8ZarCptKpfd1MfwEElK6UW93fFvrc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=WfyOvBHsvY9wPrwfDgQSvcR4FNoPoxygbPyCmizEK7zYHfBCHX/ygNP5ii+/zr8SqJmPTrT
 JOLFlZc6HI08kvyVCfpmhaoKRhdWtpfS/Fo9GuGErc8L5r1UMduKTRMEVBumIt/Vg6j4ieS2E
 wZapufWu8DfwURV466h1TVVN8jmvbxX54Px+ScCnCV27KYse602BTCcFsa7I27f61ZiJjtCKT
 DXiYoNn76kvtDLys78yTqZAJPWvxu+SoMrfXxNPaSWp/IFY8WYjuu4UNe0cyND1OqzaOdtI2v
 4aPK6wVIittGMHvvGB5tJahKTOFJPbxuz8jGKKCDJV8DNr9jp5dw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.153.9]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4s0t-1qOI3G3xPb-001xhq; Thu, 20
 Jul 2023 07:47:34 +0200
Message-ID: <898d9b03-bcaf-ec1b-2539-a290ab89aead@gmx.de>
Date: Thu, 20 Jul 2023 07:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH][next][V2] video: fbdev: kyro: make some const read-only
 arrays static and reduce type size
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230712161123.465713-1-colin.i.king@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230712161123.465713-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aHQQj7LTSb7/TMhWaW8kmCX5or1MajVcWBVOjVTCqa2/iVEBWWB
 ZKoTtFQLazh7naWbeUqu+3kSKVneApDxvdCjob6T2ZkVAWk4yVEVDvSrtvQGbrxcTyzCcq7
 nn02gWaOqeM4luhbwrEzbzDEndWlFclvegySS1HY8vo6zJFH2pAY/43g1Lfq15sefR5cIRP
 Df/Ym7zzOafhHBvXhEiqg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:p8ORew802gw=;Q0cPP/rJgzxAAwmn3zeRXwRrHBO
 iHJ8EDhhMnboXKsOHOO5IX7qBEqaeaPw2JgHheZLNnnlt/395oEvwTFWnwE+G3QNFYDvQtvYD
 wK/R0UymqG1hDcp/0jKRBExnZud948+HJyCuwEcSq1Dip8bK+gf84LWSA8rzxuH25ViNs1T1M
 iZWyJsFpDvKKCGWRpHIGwOwqSxcatvXdi94QOyvi5C2OSj7Uik5rIGRDj7BOi7v6SKiE/KJYg
 tcsA6KHM/zyrSSzMBo7Iw739uEgOWGrVHKIS/qmfVJAQYjCLQfiHJEOATk+5+PHoXOXLs4KG/
 RT9NZkYEARfA8pyGic5JCjtWOLdS2NkJqidBQs7hbCFSyDtiLweJgdVUhRiuGWI28RTpjuB3l
 RkMIW1+VIbOod4u1LNCVn9+jB9QbK0iFvhjAlXzvOjvGqu2nz1W7YmoogDMpke6+DmGPMuzsP
 ZMCyiqQphFBnpsgAkcqykuD19knHYQNwhvndp1TDqWekzTkHQod3K5ebmKFECvc7W5tu6A1UA
 IyM4f0KGH7ye2wDD6W/IwAvdmoseK44o36urmxX+wPIDP3h09qIHJY0QzwyrJImFq5RcX3Lgl
 8X2ZmvSrNK+6UrafTXsi4ojfszOquBFFFrGEg9eIdxJvORY/EewqFwDtUAiyRfckM3tOZQYvz
 NFZK7zf8tOFkCode5eUBACfpCESUpeRHOmX3GOuuBqFdlQZPNT+lCoqgZD6AhiZ72PmkSXQb2
 /8VOjUXL8ELCvLHrhGJScPSokBlURw04zSBKwI0vMdB7pqkkLyjE97bAnN65zVVdqtxwnMwm0
 lF+RDCxHrwBnN9nnxgJ4z13W+EBPwFO4J0OH2lvbq0l1sHgNMEX5nRL5R+bj/eNpkZTmt34FQ
 HivdKnvZBciZ4kn/GopuIvzlkagfoJo4UotjuP5Jc7iAztUpXKQ4DBmguXpFmdyjBsZo9fYPF
 11aYeA==
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/12/23 18:11, Colin Ian King wrote:
> Don't populate the const read-only arrays on the stack but instead
> make them static const. Use smaller types to use less storage for
> the arrays.  Also makes the object code a little smaller.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

applied.

Thanks!
Helge

> ---
>
> V2: Use smaller int types, kudos to Helge Deller for suggesting this
>
> ---
>   drivers/video/fbdev/kyro/STG4000InitDevice.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/video/fbdev/kyro/STG4000InitDevice.c b/drivers/vide=
o/fbdev/kyro/STG4000InitDevice.c
> index edfa0a04854d..79886a246638 100644
> --- a/drivers/video/fbdev/kyro/STG4000InitDevice.c
> +++ b/drivers/video/fbdev/kyro/STG4000InitDevice.c
> @@ -83,11 +83,11 @@ volatile u32 i,count=3D0; \
>   static u32 InitSDRAMRegisters(volatile STG4000REG __iomem *pSTGReg,
>   			      u32 dwSubSysID, u32 dwRevID)
>   {
> -	u32 adwSDRAMArgCfg0[] =3D { 0xa0, 0x80, 0xa0, 0xa0, 0xa0 };
> -	u32 adwSDRAMCfg1[] =3D { 0x8732, 0x8732, 0xa732, 0xa732, 0x8732 };
> -	u32 adwSDRAMCfg2[] =3D { 0x87d2, 0x87d2, 0xa7d2, 0x87d2, 0xa7d2 };
> -	u32 adwSDRAMRsh[] =3D { 36, 39, 40 };
> -	u32 adwChipSpeed[] =3D { 110, 120, 125 };
> +	static const u8 adwSDRAMArgCfg0[] =3D { 0xa0, 0x80, 0xa0, 0xa0, 0xa0 }=
;
> +	static const u16 adwSDRAMCfg1[] =3D { 0x8732, 0x8732, 0xa732, 0xa732, =
0x8732 };
> +	static const u16 adwSDRAMCfg2[] =3D { 0x87d2, 0x87d2, 0xa7d2, 0x87d2, =
0xa7d2 };
> +	static const u8 adwSDRAMRsh[] =3D { 36, 39, 40 };
> +	static const u8 adwChipSpeed[] =3D { 110, 120, 125 };
>   	u32 dwMemTypeIdx;
>   	u32 dwChipSpeedIdx;
>

