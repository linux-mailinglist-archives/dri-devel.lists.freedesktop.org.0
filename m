Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9102A99E4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 17:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32406EA93;
	Fri,  6 Nov 2020 16:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2592 seconds by postgrey-1.36 at gabe;
 Fri, 06 Nov 2020 16:56:23 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36D06EA93
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 16:56:23 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6GCDZq019449; Fri, 6 Nov 2020 17:13:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=NvXUzQ7SwVhZlDEgRqqKFTG83ZZM65jn7U6kiDFIWfY=;
 b=IiMht6/7mfHTbnDUzuycbRg8ER4z/Vfwarl53Ghk1+W0FZV+VQYt8lwC1hx5kJu7GBwG
 A2vzfylicKq2oKvE2MErumqRDR38lBUK1HI5VRBW5ha3bnUba0+Ov2hDrH8k+ICsz2Pa
 lifdWFsLrAWa/8dBKfZsaj5JshZrDU38xExNPbwj1ni8sfl+F7JlT+SK50UfxwQ7T+P+
 1hLCsHm7PB+km99FxbvozlO/14FNStV/2chHIxvKanEMH2VXAyfoBnTx7KGoVpLQIQsD
 rXk5CsObUxolG6sJ533W1JVXLKbY9KSoD4pWPBtDU+hsR9V3N+hn3wvBY07KTSMhSVtR XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h00ewcuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 17:13:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A4C7510002A;
 Fri,  6 Nov 2020 17:13:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 96F04210693;
 Fri,  6 Nov 2020 17:13:07 +0100 (CET)
Received: from SFHDAG2NODE1.st.com (10.75.127.4) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 17:13:06 +0100
Received: from SFHDAG2NODE1.st.com ([fe80::4413:c8c:992b:bb90]) by
 SFHDAG2NODE1.st.com ([fe80::4413:c8c:992b:bb90%20]) with mapi id
 15.00.1473.003; Fri, 6 Nov 2020 17:13:07 +0100
From: Yannick FERTRE <yannick.fertre@st.com>
To: Marek Vasut <marex@denx.de>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/stm: Enable RPM during fbdev registration
Thread-Topic: [PATCH] drm/stm: Enable RPM during fbdev registration
Thread-Index: AQHWsqlS5rN9KlZT7UGhoitdcGPm5am5ORqAgAABfgCAAf69AA==
Date: Fri, 6 Nov 2020 16:13:07 +0000
Message-ID: <66c438ec-42f6-0c1d-0eee-ee5501996668@st.com>
References: <20201104125200.259639-1-marex@denx.de>
 <20201105093945.GS401619@phenom.ffwll.local>
 <e7bdd094-2109-34f1-77dc-165ff2706d20@denx.de>
In-Reply-To: <e7bdd094-2109-34f1-77dc-165ff2706d20@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <11688AC651CAF446BB19B481FDDF0403@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
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
Cc: Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On 11/5/20 10:45 AM, Marek Vasut wrote:
> On 11/5/20 10:39 AM, Daniel Vetter wrote:
>> On Wed, Nov 04, 2020 at 01:52:00PM +0100, Marek Vasut wrote:
>>> Enable runtime PM before registering the fbdev emulation and disable it
>>> afterward, otherwise register access to the LTDC IP during the fbdev
>>> emulation registration might hang the system.
>>>
>>> The problem happens because RPM is activated at the end of ltdc_load(),
>>> but the fbdev emulation registration happens only after that, and ends
>>> up calling ltdc_crtc_mode_set_nofb(), which checks whether RPM is active
>>> and only if it is not active, calls pm_runtime_get_sync() to enable the
>>> clock and so on. If the clock are not enabled, any register access in
>>> ltdc_crtc_mode_set_nofb() could hang the platform completely.
>>>
>>> This patch makes sure that ltdc_crtc_mode_set_nofb() is called within
>>> pm_runtime_get_sync(), so with clock enabled.
> 
> [...]
> 
>> This looks like you're papering over a bug in your modeset code. If
>> userspace later on does a setpar on the fbdev chardev, the exact same
>> thing could happen. You need to fix your modeset code to avoid this, not
>> sprinkle temporary rpm_get/put all over some top level entry points,
>> because you can't even patch those all.
> 
> I have a feeling all those pm_runtime_active() checks in the driver 
> might be the root cause of this ? I wonder why the code doesn't use 
> pm_runtime_{get,put}_sync() only when accessing registers. Thoughts?

First line of function ltdc_crtc_mode_set_nofb check the pm_runtime to 
avoid to access registers without clock enabled.



static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
{
...
	if (!pm_runtime_active(ddev->dev)) {
		ret = pm_runtime_get_sync(ddev->dev);

I test the fb with framebuffer console, & it works fine on my side.
Do you test fb on a old kernel?
How can I reproduce your issue?

Best regards

Yannick
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
