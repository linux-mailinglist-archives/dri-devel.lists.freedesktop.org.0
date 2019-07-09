Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14480642B4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB74E89C07;
	Wed, 10 Jul 2019 07:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270F06E091
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 18:02:34 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x69I2UDs059738;
 Tue, 9 Jul 2019 13:02:30 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x69I2UA3060317
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Jul 2019 13:02:30 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 9 Jul
 2019 13:02:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 9 Jul 2019 13:02:30 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x69I2TNv093915;
 Tue, 9 Jul 2019 13:02:29 -0500
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
To: Brian Dodge <bdodge09@gmail.com>
References: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
 <1561940895-15837-2-git-send-email-bdodge09@gmail.com>
 <f2cf7c51-4857-30bd-a096-b1ce5ff01bd5@ti.com>
 <CAFaGBPk4q5Cfy4q4KqGDb7KwU_Mi22Mzu88KVO+3G7OJztyABQ@mail.gmail.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <b4bf38a7-b6d4-d496-ab7d-5e7465142ea2@ti.com>
Date: Tue, 9 Jul 2019 13:01:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFaGBPk4q5Cfy4q4KqGDb7KwU_Mi22Mzu88KVO+3G7OJztyABQ@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562695350;
 bh=IRJVny5VoeQD2A98EmS4KLxwIcs7v2cDULmwCZk55iw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=CwXSm/dcUv4L/zpCeaddVp/invdLRqGeKYLZJHY6z4KJQu+cPU3SxJUWp6eouPjB/
 MNz4WV+83d6ZDXc+v1g+A83eUwKgk+Fx/26I1UPMWXuZ+aOW1FuktrGfWbnRydtpRx
 GZ1+bRkVRRI3dPCDxwX+gRRNa0MvAbRPXxiVPGJU=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 jingoohan1@gmail.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, Pavel Machek <pavel@ucw.cz>,
 Peter Bacon <pbacon@psemi.com>, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0832264242=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0832264242==
Content-Type: multipart/alternative;
	boundary="------------2078F4511199A6746397C4CF"
Content-Language: en-US

--------------2078F4511199A6746397C4CF
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Brian

On 7/9/19 12:48 PM, Brian Dodge wrote:
> FYI: please note that pSemi's legal department has informed me that 
> they do *not* want to keep the "ArcticSand" copyright notices and the 
> single pSemi line is appropriate.
>
Thanks for the follow up.  Lawyers can be fickle about this stuff.


> On Mon, Jul 8, 2019 at 2:02 PM Dan Murphy <dmurphy@ti.com 
> <mailto:dmurphy@ti.com>> wrote:
>
>     Brian
>
>     On 6/30/19 7:28 PM, Brian Dodge wrote:
>     > The vendor-prefixes.txt file properly refers to ArcticSand
>     > as arctic but the driver bindings improperly abbreviated the
>     > prefix to arc. This was a mistake in the original patch. This
>     > patch adds "arctic" and retains "arc" (deprecated) bindings
>     >
>     > Signed-off-by: Brian Dodge <bdodge09@gmail.com
>     <mailto:bdodge09@gmail.com>>
>     > ---
>     >   .../bindings/leds/backlight/arcxcnn_bl.txt         | 31
>     +++++++++++++++-------
>     >   1 file changed, 21 insertions(+), 10 deletions(-)
>     >
>     > diff --git
>     a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
>     b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
>     > index 230abde..4d98394 100644
>     > ---
>     a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
>     > +++
>     b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
>     > @@ -1,8 +1,13 @@
>     > -Binding for ArcticSand arc2c0608 LED driver
>     > +Binding for ArcticSand arc family LED drivers
>     >
>     >   Required properties:
>     > -- compatible:                should be "arc,arc2c0608"
>     > -- reg:                       slave address
>     > +- compatible: one of
>     > +     "arctic,arc1c0608"
>     > +     "arctic,arc2c0608"
>     > +     "arctic,arc3c0845"
>     > +     "arc,arc2c0608" (deprecated)
>     > +
>     > +- reg:               slave address
>     >
>     >   Optional properties:
>     >   - default-brightness:       brightness value on boot, value
>     from: 0-4095
>     > @@ -11,19 +16,25 @@ Optional properties:
>     >   - led-sources:              List of enabled channels from 0 to 5.
>     >                       See
>     Documentation/devicetree/bindings/leds/common.txt
>     >
>     > -- arc,led-config-0:  setting for register ILED_CONFIG_0
>     > -- arc,led-config-1:  setting for register ILED_CONFIG_1
>     > -- arc,dim-freq:              PWM mode frequence setting (bits
>     [3:0] used)
>     > -- arc,comp-config:   setting for register CONFIG_COMP
>     > -- arc,filter-config: setting for register FILTER_CONFIG
>     > -- arc,trim-config:   setting for register IMAXTUNE
>     > +- arctic,led-config-0:       setting for register ILED_CONFIG_0
>     > +- arctic,led-config-1:       setting for register ILED_CONFIG_1
>     > +- arctic,dim-freq:   PWM mode frequence setting (bits [3:0] used)
>     > +- arctic,comp-config:        setting for register CONFIG_COMP
>     > +- arctic,filter-config:      setting for register FILTER_CONFIG
>     > +- arctic,trim-config:        setting for register IMAXTUNE
>     > +- arc,led-config-0:  setting for register ILED_CONFIG_0
>     (deprecated)
>     > +- arc,led-config-1:  setting for register ILED_CONFIG_1
>     (deprecated)
>     > +- arc,dim-freq:              PWM mode frequence setting (bits
>     [3:0] used) (deprecated)
>     > +- arc,comp-config:   setting for register CONFIG_COMP (deprecated)
>     > +- arc,filter-config: setting for register FILTER_CONFIG
>     (deprecated)
>     > +- arc,trim-config:   setting for register IMAXTUNE (deprecated)
>     >
>     >   Note: Optional properties not specified will default to values
>     in IC EPROM
>     >
>     >   Example:
>     >
>     >   arc2c0608@30 {
>     > -     compatible = "arc,arc2c0608";
>     > +     compatible = "arctic,arc2c0608";
>     >       reg = <0x30>;
>     >       default-brightness = <500>;
>     >       label = "lcd-backlight";
>
>
>     Reviewed-by: Dan Murphy <dmurphy@ti.com <mailto:dmurphy@ti.com>>
>

--------------2078F4511199A6746397C4CF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Brian<br>
    </p>
    <div class="moz-cite-prefix">On 7/9/19 12:48 PM, Brian Dodge wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFaGBPk4q5Cfy4q4KqGDb7KwU_Mi22Mzu88KVO+3G7OJztyABQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">FYI: please note that pSemi's legal department has
        informed me that they do *not* want to keep the "ArcticSand"
        copyright notices and the single pSemi line is appropriate. </div>
      <br>
    </blockquote>
    <p>Thanks for the follow up.  Lawyers can be fickle about this
      stuff.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAFaGBPk4q5Cfy4q4KqGDb7KwU_Mi22Mzu88KVO+3G7OJztyABQ@mail.gmail.com">
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Mon, Jul 8, 2019 at 2:02 PM
          Dan Murphy &lt;<a href="mailto:dmurphy@ti.com" target="_blank"
            moz-do-not-send="true">dmurphy@ti.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Brian<br>
          <br>
          On 6/30/19 7:28 PM, Brian Dodge wrote:<br>
          &gt; The vendor-prefixes.txt file properly refers to
          ArcticSand<br>
          &gt; as arctic but the driver bindings improperly abbreviated
          the<br>
          &gt; prefix to arc. This was a mistake in the original patch.
          This<br>
          &gt; patch adds "arctic" and retains "arc" (deprecated)
          bindings<br>
          &gt;<br>
          &gt; Signed-off-by: Brian Dodge &lt;<a
            href="mailto:bdodge09@gmail.com" target="_blank"
            moz-do-not-send="true">bdodge09@gmail.com</a>&gt;<br>
          &gt; ---<br>
          &gt;   .../bindings/leds/backlight/arcxcnn_bl.txt         | 31
          +++++++++++++++-------<br>
          &gt;   1 file changed, 21 insertions(+), 10 deletions(-)<br>
          &gt;<br>
          &gt; diff --git
          a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt<br>
          &gt; index 230abde..4d98394 100644<br>
          &gt; ---
          a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt<br>
          &gt; +++
          b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt<br>
          &gt; @@ -1,8 +1,13 @@<br>
          &gt; -Binding for ArcticSand arc2c0608 LED driver<br>
          &gt; +Binding for ArcticSand arc family LED drivers<br>
          &gt;   <br>
          &gt;   Required properties:<br>
          &gt; -- compatible:                should be "arc,arc2c0608"<br>
          &gt; -- reg:                       slave address<br>
          &gt; +- compatible: one of<br>
          &gt; +     "arctic,arc1c0608"<br>
          &gt; +     "arctic,arc2c0608"<br>
          &gt; +     "arctic,arc3c0845"<br>
          &gt; +     "arc,arc2c0608" (deprecated)<br>
          &gt; +<br>
          &gt; +- reg:               slave address<br>
          &gt;   <br>
          &gt;   Optional properties:<br>
          &gt;   - default-brightness:       brightness value on boot,
          value from: 0-4095<br>
          &gt; @@ -11,19 +16,25 @@ Optional properties:<br>
          &gt;   - led-sources:              List of enabled channels
          from 0 to 5.<br>
          &gt;                       See
          Documentation/devicetree/bindings/leds/common.txt<br>
          &gt;   <br>
          &gt; -- arc,led-config-0:  setting for register ILED_CONFIG_0<br>
          &gt; -- arc,led-config-1:  setting for register ILED_CONFIG_1<br>
          &gt; -- arc,dim-freq:              PWM mode frequence setting
          (bits [3:0] used)<br>
          &gt; -- arc,comp-config:   setting for register CONFIG_COMP<br>
          &gt; -- arc,filter-config: setting for register FILTER_CONFIG<br>
          &gt; -- arc,trim-config:   setting for register IMAXTUNE<br>
          &gt; +- arctic,led-config-0:       setting for register
          ILED_CONFIG_0<br>
          &gt; +- arctic,led-config-1:       setting for register
          ILED_CONFIG_1<br>
          &gt; +- arctic,dim-freq:   PWM mode frequence setting (bits
          [3:0] used)<br>
          &gt; +- arctic,comp-config:        setting for register
          CONFIG_COMP<br>
          &gt; +- arctic,filter-config:      setting for register
          FILTER_CONFIG<br>
          &gt; +- arctic,trim-config:        setting for register
          IMAXTUNE<br>
          &gt; +- arc,led-config-0:  setting for register ILED_CONFIG_0
          (deprecated)<br>
          &gt; +- arc,led-config-1:  setting for register ILED_CONFIG_1
          (deprecated)<br>
          &gt; +- arc,dim-freq:              PWM mode frequence setting
          (bits [3:0] used) (deprecated)<br>
          &gt; +- arc,comp-config:   setting for register CONFIG_COMP
          (deprecated)<br>
          &gt; +- arc,filter-config: setting for register FILTER_CONFIG
          (deprecated)<br>
          &gt; +- arc,trim-config:   setting for register IMAXTUNE
          (deprecated)<br>
          &gt;   <br>
          &gt;   Note: Optional properties not specified will default to
          values in IC EPROM<br>
          &gt;   <br>
          &gt;   Example:<br>
          &gt;   <br>
          &gt;   arc2c0608@30 {<br>
          &gt; -     compatible = "arc,arc2c0608";<br>
          &gt; +     compatible = "arctic,arc2c0608";<br>
          &gt;       reg = &lt;0x30&gt;;<br>
          &gt;       default-brightness = &lt;500&gt;;<br>
          &gt;       label = "lcd-backlight";<br>
          <br>
          <br>
          Reviewed-by: Dan Murphy &lt;<a href="mailto:dmurphy@ti.com"
            target="_blank" moz-do-not-send="true">dmurphy@ti.com</a>&gt;<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------2078F4511199A6746397C4CF--

--===============0832264242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0832264242==--
