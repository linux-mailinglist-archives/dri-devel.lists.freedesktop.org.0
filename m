Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D04E184217
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6756EB86;
	Fri, 13 Mar 2020 08:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56B16E104
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 10:21:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02CAFK8W006286; Thu, 12 Mar 2020 11:21:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=rOsCtm6xQiY6Dcml/SJj0vQ67L0Bz1KTNnDxNlVUuCo=;
 b=0Ht9fz8TfpB9BGgD8h2kczDR41temJrUywP/XPiVy7QUa2jOeOBewiLDVri07WmHeC7c
 1QiVzC/VVPFCFUnSGya4qbVFE+qm+ff9lj+1gAjsrRUXvwJHO2gfsTr7UpHGP6SN6Qjb
 MJId57Hs7KAS4Cl24ZQfWosRUxAakelxJdueKn5Q7nHE2Fquat6EW/c+v8deTwV88eR9
 MOoFj3H1uQ6fUadhSUwvC+mS0LwcMn4pzU2JqgKkYB9Q3K+2EvlQR0ZqJK+ckI+iAi5v
 OcDdXbEX1b6UxnHaIfSGdnP6NI8bp1QQlLjlSFZ87Ux3jGKwPFd4moWccJqYkkh2vTAg 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ynecdqu3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2020 11:21:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0EDF010002A;
 Thu, 12 Mar 2020 11:21:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1FC221F699;
 Thu, 12 Mar 2020 11:21:41 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 12 Mar
 2020 11:21:41 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Thu, 12 Mar 2020 11:21:41 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] dt-bindings: display: fix panel warnings
Thread-Topic: [PATCH v1 1/1] dt-bindings: display: fix panel warnings
Thread-Index: AQHV9T/Fg4JevMaLjkyYqXDOY+zmoqhEtMYA
Date: Thu, 12 Mar 2020 10:21:41 +0000
Message-ID: <e584e779-aab3-1a41-f198-a5585d9be2e8@st.com>
References: <20200308115017.18563-1-sam@ravnborg.org>
 <20200308115017.18563-2-sam@ravnborg.org>
In-Reply-To: <20200308115017.18563-2-sam@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <3E1A8AD3E367074F98E53AF73D1140DE@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-12_01:2020-03-11,
 2020-03-12 signatures=0
X-Mailman-Approved-At: Fri, 13 Mar 2020 08:00:36 +0000
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
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/8/20 12:50 PM, Sam Ravnborg wrote:
> Fix following type af warnings in the panel bindings:
>
> Warning (unit_address_vs_reg): /example-0/dsi/panel: node has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): /example-0/dsi@ff450000: node has a unit name, but no reg property
>
> Removing the "@xxx" from the node name fixed first warning.
> Adding a missing reg property fixed the second warning
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I will add W=1 in my command line when check the yaml files to not 
reproduce this later.

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@st.com>

Thanks,
Benjamin

> ---
>   .../devicetree/bindings/display/panel/elida,kd35t133.yaml     | 2 +-
>   .../bindings/display/panel/leadtek,ltk500hd1829.yaml          | 2 +-
>   .../devicetree/bindings/display/panel/novatek,nt35510.yaml    | 4 ++--
>   .../devicetree/bindings/display/panel/orisetech,otm8009a.yaml | 2 +-
>   .../devicetree/bindings/display/panel/panel-dpi.yaml          | 2 +-
>   .../devicetree/bindings/display/panel/panel-simple-dsi.yaml   | 2 +-
>   .../devicetree/bindings/display/panel/raydium,rm68200.yaml    | 2 +-
>   .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml | 2 +-
>   8 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> index 4bd74eaa61be..aa761f697b7a 100644
> --- a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> @@ -34,7 +34,7 @@ additionalProperties: false
>   
>   examples:
>     - |
> -    dsi@ff450000 {
> +    dsi {
>           #address-cells = <1>;
>           #size-cells = <0>;
>           panel@0 {
> diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> index 4ebcea7d0c63..2c9b8aa34815 100644
> --- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> @@ -34,7 +34,7 @@ additionalProperties: false
>   
>   examples:
>     - |
> -    dsi@ff450000 {
> +    dsi {
>           #address-cells = <1>;
>           #size-cells = <0>;
>           panel@0 {
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> index 791fc9daa68b..73d2ff3baaff 100644
> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> @@ -40,10 +40,10 @@ examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
>   
> -    dsi@a0351000 {
> +    dsi {
>           #address-cells = <1>;
>           #size-cells = <0>;
> -        panel {
> +        panel@0 {
>               compatible = "hydis,hva40wv1", "novatek,nt35510";
>               reg = <0>;
>               vdd-supply = <&ab8500_ldo_aux4_reg>;
> diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> index 6e6ac995c27b..4b6dda6dbc0f 100644
> --- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> @@ -39,7 +39,7 @@ required:
>   
>   examples:
>     - |
> -    dsi@0 {
> +    dsi {
>         #address-cells = <1>;
>         #size-cells = <0>;
>         panel@0 {
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> index 5275d350f8cb..f63870384c00 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -48,7 +48,7 @@ additionalProperties: false
>   
>   examples:
>     - |
> -    panel@0 {
> +    panel {
>           compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
>           label = "osddisplay";
>           power-supply = <&vcc_supply>;
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> index 8b60368a2425..cefe19b6bf44 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -50,7 +50,7 @@ required:
>   
>   examples:
>     - |
> -    mdss_dsi@fd922800 {
> +    mdss_dsi {
>         #address-cells = <1>;
>         #size-cells = <0>;
>         panel@0 {
> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> index 09149f140d5f..a35ba16fc000 100644
> --- a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> @@ -42,7 +42,7 @@ required:
>   
>   examples:
>     - |
> -    dsi@0 {
> +    dsi {
>         #address-cells = <1>;
>         #size-cells = <0>;
>         panel@0 {
> diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> index 186e5e1c8fa3..39ec7ae525ad 100644
> --- a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> @@ -34,7 +34,7 @@ additionalProperties: false
>   
>   examples:
>     - |
> -    dsi@ff450000 {
> +    dsi {
>           #address-cells = <1>;
>           #size-cells = <0>;
>           panel@0 {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
