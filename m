Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7DF20EF68
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5B289C9A;
	Tue, 30 Jun 2020 07:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315986E423
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 08:13:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05T8ASlU008548; Mon, 29 Jun 2020 10:13:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=w3dIE67dE3KoXbBoLblS3zP9klm4N4Ihl8g7RfI8wH4=;
 b=egF/bFkmDFi7YrM+IdLAZv0HQBZnKlfV+ZcniDcXQgm0yYyQudJlHBmPZOj+bvarfTpC
 N2vq7bC3bsrcygWGevkP28ipsoYRjbYzU/ukbSDNeWdIFxPpQgFeUFfWo0HImZzP96r6
 NO4om23b3JpL5HGFBOlb90MZs2YD59p8FBst0j1X10V6NFOGGR0HbkYH/PzXDIV5Vo4t
 BYzVz379+39a+OCZmA/jRfUyFQTVEOgQVO3QZNFcCX5rJRG2Q5MX7P5q4wGRnjxbVd+B
 OSS/qYn0R40K+763Eag4amcidi0CidlPYJjlQQnskRL6qCLn37ZAmuEGeJdhQSGA4O/t mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0ftpxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 10:13:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 510A010002A;
 Mon, 29 Jun 2020 10:13:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 136A82ADA04;
 Mon, 29 Jun 2020 10:13:28 +0200 (CEST)
Received: from SFHDAG3NODE1.st.com (10.75.127.7) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jun
 2020 10:13:27 +0200
Received: from SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86]) by
 SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86%20]) with mapi id
 15.00.1473.003; Mon, 29 Jun 2020 10:13:27 +0200
From: Erwan LE RAY <erwan.leray@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: serial: add generic DT binding for
 announcing RTS/CTS lines
Thread-Topic: [PATCH 1/2] dt-bindings: serial: add generic DT binding for
 announcing RTS/CTS lines
Thread-Index: AQHWLqwdvriVa1dO+kuLItas4TvOb6jsnKeAgAK+zQA=
Date: Mon, 29 Jun 2020 08:13:27 +0000
Message-ID: <b282002b-bca6-96a0-98f8-b4dd5f813296@st.com>
References: <20200520133932.30441-1-erwan.leray@st.com>
 <20200520133932.30441-2-erwan.leray@st.com>
 <20200627141801.GA1945477@kroah.com>
In-Reply-To: <20200627141801.GA1945477@kroah.com>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <85399D0122B0FC468E36B331A46F0E31@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-29_07:2020-06-26,
 2020-06-29 signatures=0
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:53 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/27/20 4:18 PM, Greg Kroah-Hartman wrote:
> On Wed, May 20, 2020 at 03:39:31PM +0200, Erwan Le Ray wrote:
>> Add support of generic DT binding for annoucing RTS/CTS lines. The initial
>> binding 'st,hw-flow-control' is not needed anymore since generic binding
>> is available, but is kept for backward compatibility.
>>
>> Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
>>
>> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
>> index 75b8521eb7cb..06d5f251ec88 100644
>> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
>> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
>> @@ -35,9 +35,11 @@ properties:
>>       description: label associated with this uart
>>   
>>     st,hw-flow-ctrl:
>> -    description: enable hardware flow control
>> +    description: enable hardware flow control (deprecated)
>>       $ref: /schemas/types.yaml#/definitions/flag
>>   
>> +  uart-has-rtscts: true
>> +
>>     dmas:
>>       minItems: 1
>>       maxItems: 2
>> -- 
>> 2.17.1
>>
> Did this get ignored by the DT maintainers?  :(

Hi Rob,

Gentle reminder. Could you please provide your feedback on this patch ?

Best Regards, Erwan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
