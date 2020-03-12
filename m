Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12858183386
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 15:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212FF6EAD4;
	Thu, 12 Mar 2020 14:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5756E20D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 14:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8R7y9l+79KNHQ727Uu2/8kSDNyc0QdGUDNPfAZVuOlV1whOS/rcNY4OL7aBIx6G5B1qoEAZhJhpF6vvTTW/Jwg0RVy2HZvJc39VwL8V/fZ0iCqCDEXHiEsAC8c1P6MKqN6vTe0TcFed8UEfAq342B8LiHDUr7/FgSnOLIEe5hVf0rKszfj3omopXAUfIr+imizjBWQ1qWbE7Vj1vBjehUibjGMhMNR5DC6q0iWkAk8qpKV4D1/LUFCuSBv1eTM1BqtRfDknjJPHKI3XGz+0tH7PGWXdkjmVM7iJZq6yOF2Pa9pd0bXvMqLkn4t8/EQ1/f9wv9F41/T5+yC+3oo95Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Qpq7+NZR64+Wxn8W/ZAee1uDs7YkRrIQcuf7PH01vg=;
 b=ntgm4MB3XqukOCaoL6sTYJOjaRmYe+X88zNJdksl4QS7QL/zLg5rpVN9Iz8fr+sYWzJeNkPHyFY9cRrV3bnzJKDVIUfUiEXT59bm0umSIj7GBGUSYxZTRDC6UaUqeW9S1DgnS5/jQW32Pw+XSFkHUHG/I4t4zBHtswrtPwbTVy5NIK4q9IsycyoQ23/VSK9xf2YcTumtEceJkpaBD520y+Hu4Q5HL1i3f30qSve5eMw9MOvI6AuiG86InT3w7MsbDV0Vx1kM/Yj0pZGB9qoJlk+pV8ghqmNLXc3w0+wYIoUTL3HV+78WUqijE2TCuvhgdpKY50m465cxCe/bhlLwWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Qpq7+NZR64+Wxn8W/ZAee1uDs7YkRrIQcuf7PH01vg=;
 b=JjDv+QCEESY9WIPmIAQmqr0u7gP70z05B9msmTMxhK/MTRhcnQioaIc7bRH7H5MFCzX908lm/ajvR7QJHpnQtwr5CjAx5KtKPS0UGA68pdnKIEkeLlecNUEVjtR+SUZcuSyr/vFkGXIgCRoSm7v43TBhEFl7EWCobL98pNu561Y=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4395.namprd12.prod.outlook.com (2603:10b6:303:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Thu, 12 Mar
 2020 14:43:58 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::2ca3:d95b:6303:76a5]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::2ca3:d95b:6303:76a5%7]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 14:43:58 +0000
Subject: Re: Variable Refresh Rate & flickering screens
To: Simon Ser <contact@emersion.fr>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>
References: <bRy2hTFvMya3tNzlzsjQv6uzpsgC18d0NYQx1A9Otma6wCsYLHH9X6esb47-9KWzUjVNWTi3VXCVLVGX-dlW17P0YeCFCg4OZ4KEykC0Czw=@emersion.fr>
 <647ff0e7-f186-4e16-f9b9-0908a3171051@daenzer.net>
 <tQBNlPxJxKY8FDg82d7XAuqLUkgBj4ATufP43APGI17BfwCiRpJCpUOSZiAq0V-6QONBC8S_dpI4sHsb-qQkhfkKX4usw6hSSUG_pXO3uX0=@emersion.fr>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <db6547cf-77d7-5163-8926-e1bb5ddb6d57@amd.com>
Date: Thu, 12 Mar 2020 10:43:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <tQBNlPxJxKY8FDg82d7XAuqLUkgBj4ATufP43APGI17BfwCiRpJCpUOSZiAq0V-6QONBC8S_dpI4sHsb-qQkhfkKX4usw6hSSUG_pXO3uX0=@emersion.fr>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::26) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:9240:c66::2] (2607:fea8:9240:c66::2) by
 YTOPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.20 via Frontend
 Transport; Thu, 12 Mar 2020 14:43:56 +0000
X-Originating-IP: [2607:fea8:9240:c66::2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c68cae08-9545-4fca-5f8e-08d7c693cbc6
X-MS-TrafficTypeDiagnostic: MW3PR12MB4395:|MW3PR12MB4395:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB439507EC25C9DAEDDA0FAB578CFD0@MW3PR12MB4395.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(199004)(81156014)(2616005)(66946007)(316002)(66476007)(8676002)(36756003)(53546011)(66556008)(8936002)(5660300002)(2906002)(478600001)(16526019)(186003)(31686004)(54906003)(110136005)(66574012)(966005)(31696002)(4326008)(81166006)(52116002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW3PR12MB4395;
 H:MW3PR12MB4379.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xn6JGQgwH2pAbDew2PPCJhahWOwlrFNagJPA1Atov6YwXmANpbq9mySQREYQZgQ7GOWfXHvUUBROHXAGPTWACDzBcsi8hhD0x9hTN9hPR+UU1nX0NJniqH62zxsfVrX4ywMG7eu/OCvM5ssEMIfbKQBC+o7cn1ftswOOH6OiMD9E0yiqfYEDM5GBARuoMAoUh4bB5gE6QBT3KaULvce6Ucy8K3fB4i8LMt4qjfZ4KPOWBscOS0jfk+q6zA0IumGJ5grMsiC/ghXmtlhVBtMwSd6XSBEwm3mA0lnhTSDp/lhG5VEw8AB/VYqgrRz61APxOx+KaJAY279Qp95gJYSdMoHhhcN0dDwYZiF+mHVoDCR5Hvvkx0SUw5OyGG9J7WU54QrrSnoRhXMth+Mv6IVFoHcdlwweymaydfNZNP+wsV+2QDG0Kn40+H64UXt/amLSv4u4d5i9ITrRovcb+Kts4lezrloLWlvdHkW/p3Yy3J53LGQBliL3cRRxzo8EYwb7e8KcDQzpU0d6+VLYIWEqjw==
X-MS-Exchange-AntiSpam-MessageData: EdDsyhzjjeawRXfbxXRWifEzIEBG09kSBbXGVlGkGsvTFa4Dgmyavz7bcoVT69A4s3MIXL8E8CXliuP9wyDbqSu0RA7mmPfMxge3StafdymWSHu2oYgdQWyuXUp/R2Y4AuglljasFrEFAmDV1XIEtwQaooohnSjoSvLPm3Z+Vno=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68cae08-9545-4fca-5f8e-08d7c693cbc6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2020 14:43:58.0747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96RrDinIEcxJVKj6gDZFyvJtCzUYG+Rm1vI83WThHPF02DfpXVRdFqfuhS0T0D1QlhZSq+qm4B628ImhrvnXKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4395
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
Cc: Scott Anderson <scott@anderso.nz>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Anthony.Koo@amd.com" <Anthony.Koo@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMy0xMiA3OjI1IGEubS4sIFNpbW9uIFNlciB3cm90ZToKPiBPbiBUaHVyc2RheSwg
TWFyY2ggMTIsIDIwMjAgMTE6NDUgQU0sIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5u
ZXQ+IHdyb3RlOgo+IAo+PiBPbiAyMDIwLTAzLTExIDk6MDkgcC5tLiwgU2ltb24gU2VyIHdyb3Rl
Ogo+Pgo+Pj4gSGkgYWxsLAo+Pj4gSSd2ZSBiZWVuIHdvcmtpbmcgb24gYWRkaW5nIFZSUiBzdXBw
b3J0IHRvIFN3YXkgWzFdIChhIFdheWxhbmQKPj4+IGNvbXBvc2l0b3IpLiBUaGUgY29tcG9zaXRv
ciBqdXN0IHNldHMgdGhlIFZSUl9FTkFCTEVEIHByb3BlcnR5Lgo+Pj4gVGhpcyB3b3JrcyBmaW5l
IGZvciBzb21lIHNjcmVlbnMsIGJ1dCBjYXVzZXMgZmxjaWtlcmluZyBmb3Igb3RoZXIKPj4+IHNj
cmVlbnMgYXMgZXhwZWN0ZWQgWzJdLiBGaXhpbmcgdGhlIGZsaWNrZXJpbmcgaXMgc29tZXRoaW5n
IHdlJ3ZlCj4+PiB0YWxrZWQgYWJvdXQgbGFzdCBYREMgWzNdLiBUaGUgZmxpY2tlcmluZyBpcyBj
YXVzZWQgYnkgcGh5c2ljYWwKPj4+IGxpbWl0YXRpb25zIG9mIHRoZSBzY3JlZW46IGNoYW5naW5n
IHRoZSByZWZyZXNoIHJhdGUgdG9vIHF1aWNrbHkKPj4+IHJlc3VsdHMgaW4gYnJpZ2h0bmVzcyBp
c3N1ZXMuCj4+PiBUaGUgYXBwcm9hY2ggdGFrZW4gYnkgeGY4Ni12aWRlby1hbWRncHUgaXMgdG8g
b25seSBlbmFibGUgVlJSIGlmIGFuIGFwcAo+Pj4gaXMgZnVsbHNjcmVlbiBhbmQgbm90IHByZXNl
bnQgaW4gYSBzcGVjaWFsIE1lc2EgYmxhY2tsaXN0IChlLmcuIEZpcmVmb3gKPj4+IGlzIGluIHRo
ZSBibGFja2xpc3QgYmVjYXVzZSBpdCBkb2Vzbid0IHJlbmRlciBhdCBhIGZpeGVkIGludGVydmFs
KS4KPj4+IEZvciBXYXlsYW5kLCBJJ2QgcHJlZmVyIHRvIGF2b2lkIGhhdmluZyBhIGJsYWNrbGlz
dC4gSSdkIGxpa2UgdG8gYmUKPj4+IGFibGUgdG8gdXNlIFZSUiBpbiB0aGUgZ2VuZXJhbCBjYXNl
IChub3QganVzdCBmb3IgZnVsbHNjcmVlbiBhcHBzKS4KPj4+IEEgd2F5IHRvIGZpeCB0aGUgZmxp
Y2tlcmluZyB3b3VsZCBiZSB0byBpbXBsZW1lbnQgYSBzbGV3IHJhdGUgYW5kIG1ha2UKPj4+IGl0
IHNvIHJlZnJlc2ggcmF0ZSB2YXJpYXRpb25zIGFyZSBjYXBwZWQgYnkgdGhlIHNsZXcgcmF0ZS4K
Pj4KPj4gT25lIHBvdGVudGlhbCBpc3N1ZSBJIHNlZSB3aXRoIHRoaXMgaXMgdGhlIGN1cnNvciwg
d2hpY2ggY2FuIGZlZWwKPj4gYXdrd2FyZCBpZiBpdCBvbmx5IG1vdmVzIGF0IDMwIEh6LiBJIHdv
bmRlciBpZiBhIHNsZXcgcmF0ZSB3aGljaCBjYW4KPj4gcmVsaWFibHkgcHJldmVudCBmbGlja2Vy
aW5nIGFsbG93cyB0aGUgZnJhbWVyYXRlIHRvIHJhbXAgdXAgcXVpY2tseQo+PiBlbm91Z2ggZm9y
IHRoaXMgbm90IHRvIGJlIGFubm95aW5nLgo+IAo+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBv
dXQsIHRoYXQncyBhIHZhbGlkIGNvbmNlcm4uCj4gCj4gTXkgVlJSIG1vbml0b3IgaGFzIGEgNDAt
NjBIeiBWUlIgcmFuZ2UuIFdpdGggdGhlIGN1cnJlbnQgU3dheQo+IGltcGxlbWVudGF0aW9uIGFu
ZCBkcm1fbW9uaXRvciBbMV0sIEkgY2FuIGNoZWNrIHRoYXQgbW92aW5nIG15IG1vdXNlIG9uCj4g
dGhlIG1vbml0b3IgbWFrZXMgdGhlIHJlZnJlc2ggaW50ZXJ2YWwgZ28gZnJvbSB+MjVtcyB0byB+
MTYuNm1zIChpZS4KPiA0MEh6IHRvIDYwSHopLiBSaWdodCBub3cgdGhlcmUncyBubyBzbGV3IHJh
dGUsIHNvIGl0IGdvZXMgZnJvbSBtaW4gdG8KPiBtYXggaW5zdGFudGx5LiBJIGRvbid0IG5vdGlj
ZSBhbnkgZmxpY2tlcmluZyBhbmQgdGhlcmUncyBubyBsYWcuCj4gCj4gTG9va2luZyBhdCB0aGUg
bGlzdCBvZiBtb25pdG9ycyBbMl0gb24gV2lraXBlZGlhLCBpdCBkb2Vzbid0IHNlZW0gbGlrZQo+
IHRoZXJlJ3MgYW55IG1vbml0b3Igc3VwcG9ydGluZyBsZXNzIHRoYW4gMzVIei4KPiAKPiBXZSdk
IG5lZWQgdG8gcGVyZm9ybSBleHBlcmltZW50cyBvbiBtb3JlIGhhcmR3YXJlLCBidXQgZmxpY2tl
cmluZyBoYXMKPiBiZWVuIG5vdGljZWQgYnkgb3VyIHVzZXJzIG9uIGhpZ2hlci1lbmQgbW9uaXRv
cnMgd2hpY2ggc3VwcG9ydCAxNDRIei4KPiBJIHRoaW5rIHRoZSBzbGV3IHJhdGUgd291bGQgcHJl
dmVudCBnb2luZyBmcm9tIDM1SHogdG8gMTQ0SHogZGlyZWN0bHksCj4gYnV0IHByb2JhYmx5IG5v
dCBmcm9tIDQwSHogdG8gNjBIei4gSSB0aGluayB0aGF0IHdvdWxkIGJlIGFjY2VwdGFibGUuCj4g
Cj4gSWYgaXQncyBub3QsIHdlIGNhbiBhbHdheXMgdHdlYWsgdGhlIG1pbmltdW0gcmVmcmVzaCBy
YXRlLgo+IAo+IHRsO2RyIG5lZWQgdG8gdGVzdCBvbiBtb3JlIGhhcmR3YXJlLCBidXQgc2hvdWxk
IHByb2JhYmx5IGJlIGZpbmUuCgpOb3QgdGhlIG1haW4gVlJSIGV4cGVydCBhbmQgd2UncmUgc3Rp
bGwgZGlzY3Vzc2luZyB0aGlzIGludGVybmFsbHkgYnV0IEkKdGhpbmsgaXQnbGwgdmVyeSBtdWNo
IGRlcGVuZCBvbiB0aGUgZGlzcGxheSB3aGV0aGVyIHlvdSdsbCBzZWUgZmxpY2tlcgppbiB0aGlz
IGNhc2UuCgpUaGUgb3RoZXIgY29tcGxpY2F0aW9uIGlzIHRoYXQgZm9yIGdhbWluZyB3ZSBkb24n
dCB3YW50IHRvIHVzZSB0aGUKY3Vyc29yIGFzIGEgVlJSIHRyaWdnZXIgYW5kIG9ubHkgbG9vayBh
dCBwYWdlIGZsaXBzIGluIG9yZGVyIHRvIGFsbG93CmZvciBzbW9vdGggZ2FtZXBsYXkuIEZvciBh
IGRlc2t0b3AgdXNlLWNhc2UgdGhhdCdzIHByb2JhYmx5IG5vdCB0aGUKcmlnaHQgcG9saWN5LgoK
SGFycnkKCj4gCj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vZW1lcnNpb24vZHJtX21vbml0b3IK
PiBbMl06IGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0ZyZWVTeW5jI0xpc3Rfb2Zfc3Vw
cG9ydGVkX21vbml0b3JzCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
