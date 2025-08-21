Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FBCB2ED65
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 07:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF70810E876;
	Thu, 21 Aug 2025 05:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Ywop92J5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A4210E876
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 05:04:07 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57L53qaB408813;
 Thu, 21 Aug 2025 00:03:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755752632;
 bh=rsPY5cJRKUy43fs2GdiIxOiW70aLc+LYBN/q/6aU1t4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Ywop92J5JedpVD8vJnTdRTywlG26Zz29rpfNveabvfTZ/fXA9Ad6RpOkil/7KeVLD
 +AmAkavVAP5un/hXj/y1wh+g0XxSQHGEGdIxgO5sR1fBw+C30JWO7HACbGGo3rymde
 qmZnvD19iOPkD6bJo1FB8iBHoZkiZ6f5hzoughXw=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57L53pTk2568434
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 21 Aug 2025 00:03:51 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 00:03:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 00:03:51 -0500
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57L53ief1327634;
 Thu, 21 Aug 2025 00:03:44 -0500
Content-Type: multipart/alternative;
 boundary="------------ZJwVPepw0kJMAvwVx0hIYBOL"
Message-ID: <c1edadf5-538c-43f6-aea4-8fa9f9c5aa13@ti.com>
Date: Thu, 21 Aug 2025 10:33:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] devicetree: bindings: dsiplay: panel:
 panel-simple.yaml: Add Raspberry pi dsi panel compatible
To: "Raghavendra, Vignesh" <vigneshr@ti.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Harikrishna Shenoy <h-shenoy@ti.com>
CC: <neil.armstrong@linaro.org>, <jessica.zhang@oss.qualcomm.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nm@ti.com>, <kristo@kernel.org>,
 <thierry.reding@gmail.com>, <sam@ravnborg.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <s-jain1@ti.com>,
 <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
 <20250818154746.1373656-2-h-shenoy@ti.com>
 <td7d5mldzdunb4sxs5rxa4tfnvvpolcmpwurcv5ubn47whnqek@azedwe6h3y5r>
 <8a31d1c5-4233-4696-bf8c-58f5db68d41f@ti.com>
 <fe6f848e-d7bf-477d-bad0-0c8a860f3ae6@ti.com>
Content-Language: en-US
From: Harikrishna Shenoy <a0512644@ti.com>
In-Reply-To: <fe6f848e-d7bf-477d-bad0-0c8a860f3ae6@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

--------------ZJwVPepw0kJMAvwVx0hIYBOL
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 8/20/25 15:34, Raghavendra, Vignesh wrote:
>
> On 8/20/2025 11:06 AM, Harikrishna Shenoy wrote:
>> On 8/19/25 06:54, Dmitry Baryshkov wrote:
>>> On Mon, Aug 18, 2025 at 09:17:44PM +0530, Harikrishna Shenoy wrote:
>>>> Add RPi DSI panel[0] as a valid compatible for simple-panel.
>>>>
>>>> [0]:https://www.raspberrypi.com/products/raspberry-pi-touch-display/
>>>>
>>>> Signed-off-by: Harikrishna Shenoy<h-shenoy@ti.com>
>>>> ---
>>>>    .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-
>>>> simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-
>>>> simple.yaml
>>>> index 1ac1f0219079..65f486f2bc9d 100644
>>>> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>>>> @@ -268,6 +268,8 @@ properties:
>>>>          - rocktech,rk070er9427
>>>>            # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
>>>>          - rocktech,rk043fn48h
>>>> +        # Raspberry, 7" dsi panel
>>>> +      - rpi,7inch-dsi
>>> It's powertip,ph800480t013-idf02
>> Could you please point to any documentation for this?
> Git log would point you to it:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=051e95ee7ec10050154e4c8f48be4d99ac83f8fc

Timing patterns we use differ from powertip,ph800480t013-idf02.

Link:

https://github.com/raspberrypi/linux/commit/8648a8c9442b45e85b73423be1b469d10234b4e2

https://github.com/beagleboard/linux/commit/bde1b4c52cc5a79a2108076b8706e23d5844afa9

So I think, separate compatible needs to be added.

>>>>            # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
>>>>          - samsung,ltl101al01
>>>>            # Samsung Electronics 10.1" WSVGA TFT LCD panel
>>>> -- 
>>>> 2.34.1
>>>>
--------------ZJwVPepw0kJMAvwVx0hIYBOL
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/20/25 15:34, Raghavendra, Vignesh
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:fe6f848e-d7bf-477d-bad0-0c8a860f3ae6@ti.com">
      <pre wrap="" class="moz-quote-pre">

On 8/20/2025 11:06 AM, Harikrishna Shenoy wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 8/19/25 06:54, Dmitry Baryshkov wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Mon, Aug 18, 2025 at 09:17:44PM +0530, Harikrishna Shenoy wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Add RPi DSI panel[0] as a valid compatible for simple-panel.

[0]: <a class="moz-txt-link-freetext" href="https://www.raspberrypi.com/products/raspberry-pi-touch-display/">https://www.raspberrypi.com/products/raspberry-pi-touch-display/</a>

Signed-off-by: Harikrishna Shenoy <a class="moz-txt-link-rfc2396E" href="mailto:h-shenoy@ti.com">&lt;h-shenoy@ti.com&gt;</a>
---
  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-
simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-
simple.yaml
index 1ac1f0219079..65f486f2bc9d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -268,6 +268,8 @@ properties:
        - rocktech,rk070er9427
          # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
        - rocktech,rk043fn48h
+        # Raspberry, 7" dsi panel
+      - rpi,7inch-dsi
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">It's powertip,ph800480t013-idf02
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Could you please point to any documentation for this?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Git log would point you to it: 

<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=051e95ee7ec10050154e4c8f48be4d99ac83f8fc">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=051e95ee7ec10050154e4c8f48be4d99ac83f8fc</a>
</pre>
    </blockquote>
    <p>Timing patterns we use differ from <span
      style="white-space: pre-wrap">powertip,ph800480t013-idf02.</span></p>
    <p>Link:<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/raspberrypi/linux/commit/8648a8c9442b45e85b73423be1b469d10234b4e2">https://github.com/raspberrypi/linux/commit/8648a8c9442b45e85b73423be1b469d10234b4e2</a></p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/beagleboard/linux/commit/bde1b4c52cc5a79a2108076b8706e23d5844afa9">https://github.com/beagleboard/linux/commit/bde1b4c52cc5a79a2108076b8706e23d5844afa9</a><br>
    </p>
    <p>So I think, separate compatible needs to be added.<br>
    </p>
    <blockquote type="cite"
      cite="mid:fe6f848e-d7bf-477d-bad0-0c8a860f3ae6@ti.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">          # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
        - samsung,ltl101al01
          # Samsung Electronics 10.1" WSVGA TFT LCD panel
-- 
2.34.1

</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------ZJwVPepw0kJMAvwVx0hIYBOL--
