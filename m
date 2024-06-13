Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08E2907DD1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 23:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D20010EB9E;
	Thu, 13 Jun 2024 21:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="VAbdZP3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E81610EBAB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 21:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1718312778; x=1718917578; i=deller@gmx.de;
 bh=mKeKaB45Mvm9ojxZe34BD21OCSnrwP8XDXXlHo8Ra70=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=VAbdZP3xmLDBYP1Jt9Pz/sVGT72mCF46KqfInkxli1AV8xMfsCI7Z2BB+1js9wyv
 mx3KedGDDNJSVo9DKhoClCRP8v19f3SF/TeCTZZKZdEPAGKUIll7g0dgE8gJdx7J4
 tz3TyQBM9SzhSU30bfS57EKa/3PDQjFdvjae5RSDXcGoNUc9FYTNXS+ah/47q59/c
 3/SlsflW4ftIRFg+g8+a2du661CR27oS2CJEz0c2F62HVaJg1/GplgFMW+MGFlxNw
 tHrZvr4NgOo59iuxSNhfVS43nbApUtRyV+CO5TeBV1MvBqdVdauLyQyB3pnTQ2tEy
 PRay2wSZ4z3usOPRdA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([83.135.217.92]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4z6q-1sRrYs35OO-013ovC; Thu, 13
 Jun 2024 23:06:18 +0200
Message-ID: <77c4c6a9-b3ea-4b59-a76e-4df20528f754@gmx.de>
Date: Thu, 13 Jun 2024 23:06:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video/logo: Make logo data const again
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <1ea18c51dd1c029e3c50bfb082f5942b58b7360c.1718199543.git.geert+renesas@glider.be>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <1ea18c51dd1c029e3c50bfb082f5942b58b7360c.1718199543.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zOjXs4vDBJRmXROdZGlRMloueU8T6TyCmMFsO+NW6OMDSA9vC5m
 ZQM6BBv0IDhp2HuKQeQ8loDiY0/BIVmFWVKDvG5KwOlI2jsFRWXcopovEnBnpyRBvfUhpZo
 OFd8pM6SuFpgiqQwO+FpDGisXTCTJKUMQ8ug9OJA9TUn/tETrYmelTp1jo5GEaXbNJJBhNz
 7VkD+tvZ+SRKvWLcKp/MQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dy8DHBxtiyM=;egjRitOsveNPXvbk93J7mGAy/6W
 lO1tB998AsbYE3YITkFZC3HJs7DiE9sOSopaO4/ZSq9E50d/PET7/ei+J3c7TH5ND70mLxxsW
 ns7emn0NxTZdUfXM/VvwndwaINq4fHK55jMdnJZkrumCBGHf0UL5oVSRSMa5+MRDipqEWylxk
 kyOn0Nxo9Z0tTH9TvwF1N0VuRJpS6aQjifcakrRNFj7TANF+c9rYCa4of3nTqQ87V0F03Itis
 9ZaSkOgrnjtCKVQGuw438EW0Gy2Qgiq8z4XGT3LSKS6on1NqmyJycUC0vOgpRSdwiyI2wq7fa
 P7zXgXDn9n1QZcKO1MsYnMqjX/FHCn6JrDo7PkkUqkgSl0GQxF7uX/gnixU8JTY183sh2LnDP
 RwMCXqF/pObX6oPIM14RI5/WYlhcSo+hYn8UQ1VGBplBXid904OEtnfGEnUcv4YRLkmH2ed50
 yjiKbRoCFpythhXcWX6AKr5EXyLnyBDgLkSrC/uriXJXvR4JJ3nU1QaWSgzdB/DtwkZgEVnla
 DNBE6PfbUTzlEcnwWFPoDHJ4RF/PEaY0WXBQlsJNUF3y5ZYuHRULb/Eer40e3QaB0iA5fMrcM
 al4YHZowWk3XkkqC6L9dxw1y0J+/CB/YQfMFoDwbakxIgGna27tIT1aZqyOlZ8IGUy5+pvmzV
 2Be2YJAz0ATu9qdb83f1lNz68nPutW97dKEcO6XU3e1x5lNjbiW4r32bi54DK1XnnU2tVWRZV
 keULqIbIA6ljdY+N0ZY1I75MXX/I1DO7ZQoHVuEF2itDAj23zEAQzXkAFsnD9MW2rln4gE2ra
 60duWOjnShX+/ZJ5iQOKUqOPfy1TEbYcBRjgKkYNNLG0Y=
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

On 6/12/24 15:41, Geert Uytterhoeven wrote:
> As gcc-4.1 is no longer supported, the logo data can be made const
> again.  Hence revert commit 15e3252464432a29 ("fbdev: work around old
> compiler bug").
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

applied.
Thanks!

Helge

> ---
>   drivers/video/logo/pnmtologo.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/logo/pnmtologo.c b/drivers/video/logo/pnmtolo=
go.c
> index 8080c4d9c4a23fbb..28d9f0b907a99a05 100644
> --- a/drivers/video/logo/pnmtologo.c
> +++ b/drivers/video/logo/pnmtologo.c
> @@ -238,7 +238,7 @@ static void write_header(void)
>   	fprintf(out, " *  Linux logo %s\n", logoname);
>   	fputs(" */\n\n", out);
>   	fputs("#include <linux/linux_logo.h>\n\n", out);
> -	fprintf(out, "static unsigned char %s_data[] __initdata =3D {\n",
> +	fprintf(out, "static const unsigned char %s_data[] __initconst =3D {\n=
",
>   		logoname);
>   }
>
> @@ -375,7 +375,7 @@ static void write_logo_clut224(void)
>   	fputs("\n};\n\n", out);
>
>   	/* write logo clut */
> -	fprintf(out, "static unsigned char %s_clut[] __initdata =3D {\n",
> +	fprintf(out, "static const unsigned char %s_clut[] __initconst =3D {\n=
",
>   		logoname);
>   	write_hex_cnt =3D 0;
>   	for (i =3D 0; i < logo_clutsize; i++) {

