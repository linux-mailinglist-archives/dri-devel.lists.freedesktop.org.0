Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C6A131647
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 17:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B586E4A1;
	Mon,  6 Jan 2020 16:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B994B6E4A1
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fHCqKA80u5NASV1pLYpW+PomktqDzS5QR7r7N/IPo38=; b=sb3amGNiUMrG1Mw6I+zMFN1zVA
 hrKr9c5nliKBR1ayEo3c9fXAYHrBczY0oOc8ALP754zGq32oWLDRzDKS7wvHsgCj7b7w+VahOf3FH
 GGpQYXUEJrNH5MPcPfrUzBJRG7AJoFftYfCJlpXKbEkBQ6/UnxU1bQWYZHigdMrVEImNIC/SoZjB7
 7Olxxsq8zzeQKNKjvgr0cjXsyv0kSLah4I0Tb0D/Krv0TrW3idm6vxy2VV5hzcSICwg28s+xSBIzq
 EXEoE7kJ7CtoUuYF0OQbVq538RUnaxp7wZkEQSMAAvMRARbBX0E1oembH6gYiGsR6ovjtmnm446fW
 UxyXzHZw==;
Received: from [2600:1700:4830:165f::fb2] (port=55016)
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1ioVXp-0002In-F0; Mon, 06 Jan 2020 11:47:57 -0500
Subject: Re: [PATCH 1/3] dt-bindings: display: sitronix, st7735r: Add Okaya
 rh128128t
To: Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20200102141246.370-1-geert+renesas@glider.be>
 <20200102141246.370-2-geert+renesas@glider.be>
 <20200102144636.GA10075@ravnborg.org>
From: David Lechner <david@lechnology.com>
Message-ID: <a324b889-4fd1-fd93-dd70-61a6a57713a1@lechnology.com>
Date: Mon, 6 Jan 2020 10:47:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200102144636.GA10075@ravnborg.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/2/20 8:46 AM, Sam Ravnborg wrote:
> Hi Geert.
> 
> On Thu, Jan 02, 2020 at 03:12:44PM +0100, Geert Uytterhoeven wrote:
>> Document support for the Okaya RH128128T display, which is a 128x128
>> 1.44" TFT display driven by a Sitronix ST7715R TFT Controller/Driver.
>>
>> ST7715R and ST7735R are very similar.  Their major difference is that
>> the former is restricted to displays of up to 132x132 pixels, while the
>> latter supports displays up to 132x162 pixels.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>   .../devicetree/bindings/display/sitronix,st7735r.txt          | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
>> index cd5c7186890a2be7..87ebdcb294e29798 100644
>> --- a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
>> +++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
> While touching the bindings file, can I convince you to convert it to
> meta-schema format (.yaml)?
> 
> 
>> @@ -4,7 +4,9 @@ This binding is for display panels using a Sitronix ST7735R controller in SPI
>>   mode.
>>   
>>   Required properties:
>> -- compatible:	"jianda,jd-t18003-t01", "sitronix,st7735r"
>> +- compatible:	Must be one of the following combinations:
>> +		  - "jianda,jd-t18003-t01", "sitronix,st7735r"
>> +		  - "okaya,rh128128t", "sitronix,st7715r"
> 
> It would be nice if there was a "description" for each pair of
> compatible that identified the actual panel.
> In your case "Okaya RH128128T 1.44" 128x128 TFT display"
> It can be looked up in git history - but better to have it in the
> binding file.
> 
> 	Sam
> 

It would be nice to have the Adafruit part name in here too while we
are at it. I had to dig really deep to find what the actual display
panel was.

https://www.adafruit.com/product/358
https://www.adafruit.com/product/618
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
