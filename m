Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA92A70A39
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 20:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E449710E5E6;
	Tue, 25 Mar 2025 19:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="bch9kafd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Gbnzzq1O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="CllMrdA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3923 seconds by postgrey-1.36 at gabe;
 Tue, 25 Mar 2025 19:22:42 UTC
Received: from fallback16.i.mail.ru (fallback16.i.mail.ru [79.137.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D87D10E5E7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 19:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Content-Type:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=bHak7CIhU3XGeDQnS4Ni48tNDlFPRazY6vfcR1Zus4o=; 
 t=1742930562;x=1743020562; 
 b=bch9kafdeGEhKI/4MZlHqOnck7Lz+UqZI1fYiuM4gVBK3AAFWjHMtlHVtfBYcxaAEk4JenZAsShaFmYUDRmp2XEm/4N2CY0eio8P9EXB0YRZCd/aY0cFvuE2o8ysJ6ibm+P48nJ9XFleav2kfw6UkFozogSz4NId3ss8sxe6dZI=;
Received: from [10.113.42.3] (port=50090 helo=send55.i.mail.ru)
 by fallback16.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1tx8px-001xAf-Ih
 for dri-devel@lists.freedesktop.org; Tue, 25 Mar 2025 21:17:17 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Content-Type:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=bHak7CIhU3XGeDQnS4Ni48tNDlFPRazY6vfcR1Zus4o=; t=1742926637; x=1743016637; 
 b=Gbnzzq1O8dIONb1d0oy4lw1VPmVzyBanP+jA7YU7g8imC93CZCM6rjUAtAocGD5Ob8PsNZS3W+l
 Qd+R+AsxS9yow9JuVh1LNa7KFmVGx1lTSsd/aMKS2nPIRak9btzMWTMe+Kkh4nEWTHGgPhVjRV3OS
 6bcbkPsz4g3xoLBdQs4=;
Received: from [10.113.185.249] (port=49436 helo=send126.i.mail.ru)
 by exim-fallback-6464776d59-6qwjh with esmtp (envelope-from
 <danila@jiaxyga.com>) id 1tx8pv-000000000pj-059A
 for dri-devel@lists.freedesktop.org; Tue, 25 Mar 2025 21:17:15 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Content-Type:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=bHak7CIhU3XGeDQnS4Ni48tNDlFPRazY6vfcR1Zus4o=; t=1742926635; x=1743016635; 
 b=CllMrdA65VRVNKljUtPoV+Arvvil2UJe3fQXbFdXwxymoLDf71GQYtwIGn8r2fUVnoPgalznT1j
 JhHnHfU0kuETWUyT0swvaED8nPd81cT+xCCetH4JjEXWwno8VXuuRwhRlSfMgOHJEFOk/rYdRVlBu
 hgSVGhTfKhxN4GDOJtQ=;
Received: by exim-smtp-75f69ddc6c-p5h7l with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1tx8pe-00000000LJD-1oxG; Tue, 25 Mar 2025 21:16:59 +0300
Content-Type: multipart/alternative;
 boundary="------------oDh0efs5Fs0nuoDloUOgRRRn"
Message-ID: <190ba70d-89bd-4e46-b7e5-7b93d706d84f@jiaxyga.com>
Date: Tue, 25 Mar 2025 21:16:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Visionox G2647FB105
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexander Baransky <sanyapilot496@gmail.com>, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, dri-devel@lists.freedesktop.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250325155756.703907-1-sanyapilot496@gmail.com>
 <20250325155756.703907-2-sanyapilot496@gmail.com>
 <ed62d5f3-a728-4d11-9b59-28496ed267db@kernel.org>
Content-Language: en-US
From: Danila Tikhonov <danila@jiaxyga.com>
In-Reply-To: <ed62d5f3-a728-4d11-9b59-28496ed267db@kernel.org>
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9FDFD0F247F37F8A94D7A256720A9477B42BC627017E8CD54182A05F5380850404C228DA9ACA6FE27E9B8A19352104D063DE06ABAFEAF670536CAF8D46B51DBBFE17DEA2A26EFA8E7ECA116FACD37B17E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7922D113DFDC6D5A3EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566F506D4AEC5146499F0A47A4E0E67894CFC75C7302F827762663C8D2799D74236389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C07E7E81EEA8A9722B8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B652D31B9D28593E51CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C2249537E5CF43EE7B3DE76E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8B2B4B37CDEA75E1A13AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FCF1175FABE1C0F9B6E2021AF6380DFAD18AA50765F79006371BCC3D0A94B9E03222CA9DD8327EE493B89ED3C7A6281781F1C9CF18C8EB2269C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5B7D14924C87CC75F5002B1117B3ED6961399409DC2BE5A77219207EC0A953D2C823CB91A9FED034534781492E4B8EEAD3B72D73EA5828B68BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34D041FB2E16F174C4E793B4EB6EF1D21904CDF94999A12D510F9391E47169F35EDCE6B182FFE808531D7E09C32AA3244CB910A24BE6FCE7C577DD89D51EBB7742A24BE0EC2B6E5049EA455F16B58544A26EF364EE5276B8775DA084F8E80FEBD322CFFF16B4474ECB4573B60270F1EB7C214C2BC1176D5C25
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVRxnlmV4XzQlm7z6MuFiGMI=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F543B928121277352CDECE012BE5914E03CB2316A1E1B89F5F1476193E8E264BC2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B46F1365605F506BE6557ECA4736DAD9B3900641F8407733BF049FFFDB7839CE9EBEBC39A08AD15DF96C75ECC2D3E0A160D5851D17A288450125B2725220BBBB5AFBB1DFDFE13E979A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZodteJKI6Q6oCJuzGJSLduw==
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B46F1365605F506BE6557ECA4736DAD9B384E529A7BFBCE18A049FFFDB7839CE9EBEBC39A08AD15DF9AD07890B58261C4DFE54A20E1E29A85F926F54B1D4AA717B
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZodteJKI6Q6rM6Z/XrdkfrA==
X-Mailru-MI: 20000000000000800
X-Mras: Ok
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

This is a multi-part message in MIME format.
--------------oDh0efs5Fs0nuoDloUOgRRRn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/25/25 19:35, Krzysztof Kozlowski wrote:
> On 25/03/2025 16:57, Alexander Baransky wrote:
>> The Visionox G2647FB105 is a 6.47 inch 1080x2340 MIPI-DSI CMD mode
>
> "Add a DT binding for the Visionox....."
>
>> AMOLED panel used in:
>> - Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
>> - Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)
>>
>> Add a dt-binding for it.
> And drop this sentence.
>
>> Signed-off-by: Alexander Baransky<sanyapilot496@gmail.com>
>> ---
>
> ...
>
>> +properties:
>> +  compatible:
>> +    const: visionox,g2647fb105
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  vdd3p3-supply:
>> +    description: 3.3V source voltage rail
>> +
>> +  vddio-supply:
>> +    description: I/O source voltage rail
>> +
>> +  vsn-supply:
>> +    description: Negative source voltage rail
>> +
>> +  vsp-supply:
>> +    description: Positive source voltage rail
> Are you sure these are real voltage rails on the device? Weirdly similar
> to some old Samsung AMOLED panels...
Hello Krzysztof,

I was somewhat intrigued by your observation, especially since I have
some schematics for this device. The patch correctly adds four
regulators – ibb, lab, vdd (3p0), and vio (1p8).

This situation arises from Xiaomi’s tendency to use different panels in
various revisions of the same device. Although, AFAIK, the
sm7150-xiaomi-toco/tucana was released with only one possible variation
(which this series adds), the sm7150-xiaomi-davinci offers a different
perspective. The latter was initially produced with a samsung,ams639rq08
panel (which I had added previously), yet official service centers have
replaced the factory panel with the visionox,g1639fp106 during repairs.
This suggests that, in terms of power configuration, the
samsung,ams639rq08 and the visionox,g1639fp106 panels are effectively
identical.

It is therefore likely that the visionox,g2647fb105 from this series
follows the same way.

Nevertheless, it is reassuring that I can confirm these findings with
the schematics rather than relying on mere guesswork xD

---
Best wishes
Danila
> Best regards,
> Krzysztof
--------------oDh0efs5Fs0nuoDloUOgRRRn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/25/25 19:35, Krzysztof Kozlowski
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ed62d5f3-a728-4d11-9b59-28496ed267db@kernel.org">
      <pre wrap="" class="moz-quote-pre">On 25/03/2025 16:57, Alexander Baransky wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The Visionox G2647FB105 is a 6.47 inch 1080x2340 MIPI-DSI CMD mode
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">

"Add a DT binding for the Visionox....."

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">AMOLED panel used in:
- Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
- Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)

Add a dt-binding for it.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And drop this sentence.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Signed-off-by: Alexander Baransky <a class="moz-txt-link-rfc2396E" href="mailto:sanyapilot496@gmail.com">&lt;sanyapilot496@gmail.com&gt;</a>
---
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">

...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+properties:
+  compatible:
+    const: visionox,g2647fb105
+
+  reg:
+    maxItems: 1
+
+  vdd3p3-supply:
+    description: 3.3V source voltage rail
+
+  vddio-supply:
+    description: I/O source voltage rail
+
+  vsn-supply:
+    description: Negative source voltage rail
+
+  vsp-supply:
+    description: Positive source voltage rail
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Are you sure these are real voltage rails on the device? Weirdly similar
to some old Samsung AMOLED panels...</pre>
    </blockquote>
    Hello Krzysztof,<br>
    <br>
    I was somewhat intrigued by your observation, especially since I
    have<br>
    some schematics for this device. The patch correctly adds four<br>
    regulators – ibb, lab, vdd (3p0), and vio (1p8).<br>
    <br>
    This situation arises from Xiaomi’s tendency to use different panels
    in<br>
    various revisions of the same device. Although, AFAIK, the<br>
    sm7150-xiaomi-toco/tucana was released with only one possible
    variation<br>
    (which this series adds), the sm7150-xiaomi-davinci offers a
    different<br>
    perspective. The latter was initially produced with a
    samsung,ams639rq08<br>
    panel (which I had added previously), yet official service centers
    have<br>
    replaced the factory panel with the visionox,g1639fp106 during
    repairs.<br>
    This suggests that, in terms of power configuration, the<br>
    samsung,ams639rq08 and the visionox,g1639fp106 panels are
    effectively<br>
    identical.<br>
    <br>
    It is therefore likely that the visionox,g2647fb105 from this series<br>
    follows the same way.<br>
    <br>
    Nevertheless, it is reassuring that I can confirm these findings
    with<br>
    the schematics rather than relying on mere guesswork xD<br>
    <br>
    ---<br>
    Best wishes<br>
    Danila <span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:ed62d5f3-a728-4d11-9b59-28496ed267db@kernel.org">
      <pre wrap="" class="moz-quote-pre">
Best regards,
Krzysztof
</pre>
    </blockquote>
  </body>
</html>

--------------oDh0efs5Fs0nuoDloUOgRRRn--
