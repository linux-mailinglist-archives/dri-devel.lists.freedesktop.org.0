Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 843D87F896C
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 09:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3B010E125;
	Sat, 25 Nov 2023 08:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85FE10E125
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 08:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1700902612; x=1701507412; i=deller@gmx.de;
 bh=xGxWfDL6iPcS1KThu3UcrWwZIREKMiaDHhBVBMgghjI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=d9POGsLtiljwm3pksbf6jk5oS9Lmb3twBWYMOZV+KR8BnikmW4+z5G6isJ7Peh4T
 2N4FAQOrp4bpoXxIqeXFp7HlKoXNOFaDHfiTKJrI2gOK4IgPEO6ngc1C2B6UZtNjV
 VQrGhNr+ECRFYPuiAz3M1mzKI+mUA3uFgomiWzjh3ICYoURjogKLjYF2qFlSrVDmJ
 XARfo7zlvCLH5AD8aPTFNumsBrQsXGVZuCtj66kbK6lob9tjoO/Nbc20f03UGtjKE
 Aai8TE89RBqlW75/XAuG4iVX2vfwOafYgox+8DlZijFe2e8QBURTFe03ArMW83hTk
 IU3mPei/H3A3tSjrWA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.47]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPokD-1qtwHP10QF-00MrYs; Sat, 25
 Nov 2023 09:56:52 +0100
Message-ID: <c0272fa5-6415-4f78-9a05-d7e0621db5e6@gmx.de>
Date: Sat, 25 Nov 2023 09:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fbdev: mmp: Fix typo in code comment
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
References: <20231124095221.659445-1-dario.binacchi@amarulasolutions.com>
 <de706c0c-d6dc-45d4-a316-56ff56be5c25@infradead.org>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <de706c0c-d6dc-45d4-a316-56ff56be5c25@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3tCff3RyjUO6LGAGHQXfb3+gZRmSXzAacFpuCN0zICtoZqsQ0jT
 RY4lAsoH7jTog6NrEwMktmt0XfHsiIYCt5ZjHVAkzpT41TQ0dnmZ6FlCxu3VrEhEXLIwLZK
 jwAdGiOzmtnyx87oTmQx6eiNDfEV49k2PpWj2ricP0U0ntmWZCmlKUmfhpLK6Px7sgaY7rq
 aKDFh3D+srKK0LdJKsGRg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VikTtrgkpx0=;794JxiwjxoZuIaJCBUT1mWBr9Yv
 hR+dvJUJ1wVkbF18f1sqltaC1W8rBw3dOTwKRR9mr8qx/JqE+MpfjNrCKSV3t7dPljCzZrMkD
 XH7BAPhtgr+5ngI2aKmJFwhoeQkHNCzxksA0+n5t2D7SHLsw6pX/R8HUdgiPJ2nsC+vy5b09X
 p3dxAeFo7ggUynJSi6kdS/GusxN89NSIwDv8QHNThY6WMjOkmjZa83+bUblDAhpdEz8k/YPVf
 rEK/Ny8IKV0doEsDf9wx6n95BYTBSPzct5H2qcBOSwv0wkZsAUH9u1MT69OdVzjR7i0ET7YGl
 8xFRH8I+9a/GOTGuQnkxLdCTJXcaZDExIEhgGN/VMFkQcUxBhJUrxY+x+krFdmlFjLDPMf4JX
 NEj5aJkn7ZpmLt+s2cl4SFUXKdaPS0St+2oBco1PCd+ug4OyrkVQce1PJP2tsy25oPkuqxM6t
 vvnTRTewSTmad1bcCv698Kwaizc7hFk8hOVhafXhrgJNs8qHdh5/7uHXlXEREe6H0kUYapAyk
 JVCopjlrq0FKzxfYur/eY+OwbZZ0uQb2vswyuZYJCmbC7Bp50XEXYQBofuRpXYI8vIwNBTch5
 nEb/Y0mhx4tD29g9Z/UiMIPr4lTDWxkJLEI8ywUMzD4GtyyV/Ng2mSvmuyL4p65z1QJJRcQ3j
 GOEHHeVIMpmNHrklSGiHRz3KdwxZLTnAMlVwpkqisCaJWwPTcZ61O19PuPHL9EhRUVtFdExHb
 bC37AONAgnCnI3OzO0fJ6dscyAwBtDSmbc/9OqsTVvUBc95cXHdpNi7plhc6mhABFJJBBG/DW
 mdlz8+PvOBqZXAVDZmvKwpFr0JZ9wZjXZXSW2FXBaLku2d49PMSIJAXEcxBGrSg+cdoxdfBo3
 sV1Z5+8VpoHcxDaRVo5RMBcAemH2qZ9Hng/GkJpyK9YWsj47sq/t0CI3EXPAv9KUtlpn2GbfZ
 YTZJ2fo2bR40zHxkewH+TFUgLc4=
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
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Zhou Zhu <zzhu3@marvell.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/24/23 16:34, Randy Dunlap wrote:
> Hi,
>
> On 11/24/23 01:52, Dario Binacchi wrote:
>> s/singals/signals/
>>
>> Fixes: 641b4b1b6a7c ("video: mmpdisp: add spi port in display controlle=
r")
>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>> ---
>>
>>   drivers/video/fbdev/mmp/hw/mmp_spi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/mmp/hw/mmp_spi.c b/drivers/video/fbdev=
/mmp/hw/mmp_spi.c
>> index 16401eb95c6c..64e34b7e739e 100644
>> --- a/drivers/video/fbdev/mmp/hw/mmp_spi.c
>> +++ b/drivers/video/fbdev/mmp/hw/mmp_spi.c
>> @@ -91,7 +91,7 @@ static int lcd_spi_setup(struct spi_device *spi)
>>   	writel(tmp, reg_base + LCD_SPU_SPI_CTRL);
>>
>>   	/*
>> -	 * After set mode it need a time to pull up the spi singals,
>> +	 * After set mode it need a time to pull up the spi signals,
>
> Also:
> 	                  it needs time
> or
> 	                  it needs some time

I've fixed it up and applied that patch to fbdev git tree.

Thanks!
Helge

