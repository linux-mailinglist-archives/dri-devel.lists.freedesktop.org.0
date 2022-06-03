Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDA153CBA7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 16:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC1B10E63E;
	Fri,  3 Jun 2022 14:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4F510E63E;
 Fri,  3 Jun 2022 14:38:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFO9p0dXeSW7mW/Y18gyZp/Eph3QDn+yUu+kdsuB1rV5tEgaI2W7NFwVgwiIL7gcEvRmYh7GqcIFU4GMY976/n1F8Z0rGjbETyQCgACDaLWKXoUwbX4/KZVbH5wvKFgZow9Eja4j3SS60a99ZzewqXu7NbCgGmyN3GWRVFzyO9HcOvGFdb8gqySKStqq0bHXcSl8XvfoNZpMQEDVszxN/6zA1dff3CVnVuOekLN07VYTfiAf82P6yidGaSzJ3SCdXFCY1duPHg36tj4YMIxLwpj++f6JnU5eLmz1iM2VCgRamaibARIoDYA0OrRvsYoBn17NBCugqjfQ2T30l8D+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LabBx+GRxEVhbEXOsKZXXKUUd23j2IfijlmHsRnF/EM=;
 b=nHASZY0860mnk57nT3wsvPFjsdlz8r/z+eFEhOlD7bo6NQXKWCt8oPoVG3Nmyv/A9wPIM3mcJNahv45WWTWOaPwwEOxmrXBsUK7V/mtGaSLYo8yVtFG4+gXU0HxfsUhCZE6DUcI+gKvQRxstmnzoK1vYfl1M1h1awI/FNyFSY6K+L/QQJMZuzMWPU7kPvVjZGvArl0rx1X782Gyyx0HKkTIlIVArcx5nHgh5fxl61kvJ2rUpCz4wMDgaNbX0xisvEyQVnJiX2enY2jtVI7bKGFzzCGlRd82mJNTEaGnNcK4ASTkEVeT2KZqS7gSUGjewxt4qco8Nilh8RfKmySJYog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LabBx+GRxEVhbEXOsKZXXKUUd23j2IfijlmHsRnF/EM=;
 b=zraoB29GYlpPjdswIL9TEbhec6YFR6Aru4Ok/Ni9K/CuLBPCT2UBinB6DDNB/5vhI1SCJK/rxXHYLYb1bs+KaK5oXJio4+uAdXLS7sKuPT9k4NWWfdgtJeI7eHrfV39ng18F76wlujtfcOCgw2bmGCzX5JG3a3OU39VZ/w8hPv0=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by CH2PR05MB7174.namprd05.prod.outlook.com (2603:10b6:610:45::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.4; Fri, 3 Jun
 2022 14:38:54 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::10c6:987:f526:83aa]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::10c6:987:f526:83aa%3]) with mapi id 15.20.5332.006; Fri, 3 Jun 2022
 14:38:54 +0000
From: Zack Rusin <zackr@vmware.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Topic: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Index: AQHYdpeKjA+fIeSl9UGD1Oezsoj+Fa09u26AgAADaYCAAAGbAIAAAasA
Date: Fri, 3 Jun 2022 14:38:54 +0000
Message-ID: <06E05345-758E-456A-803D-B50978A935CA@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <0F911D96-1C9B-4EF1-84D7-F5335B3FFEB7@vmware.com>
 <5Et1VowGX_0a0i5weC4YVMX7bhGDU45hQyiv4CjqyxQStY1CSUJs-xamBowRO8go8yCk1l_jgKmM_OrMB0Fdx166545AX5nL09NGsEYaBs0=@emersion.fr>
In-Reply-To: <5Et1VowGX_0a0i5weC4YVMX7bhGDU45hQyiv4CjqyxQStY1CSUJs-xamBowRO8go8yCk1l_jgKmM_OrMB0Fdx166545AX5nL09NGsEYaBs0=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31b0d19b-e7dc-4dec-cbe4-08da456ec8fa
x-ms-traffictypediagnostic: CH2PR05MB7174:EE_
x-microsoft-antispam-prvs: <CH2PR05MB717415C7D368F597CE93CA2DCEA19@CH2PR05MB7174.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: by5w6/hdhN3IqTMxndIMn7HWU0k8YMniw95hXXh8dYmGuMbZ4+YFW8F4R+ml7rj72DMD+qcQ7obb6yq68Ka3r2pIN4qh00fICLR8werCMHopnqiktUnJATGa2HK5ulxBTm1gJL3R8PLS2eu7O7VwroYBVLGo4FvKrZGX1fHS3SQ4kX3vB/IEdpXDV9baQ9HVXo74WCNTiInQqECIIAeyVEyvOOxDN0i7EPdNSPFg4GtM/kqaoi7xHBk8UOoM4sJR3KQFa2Rve9V/IIOM78C59anPZJNhaTint1+Qdn2ffQpEr5/EVMMQhRtstBHOyty2cvSYq+jDf1BbWs5cFL60IOR46+YY+AlqpidzPqFWWzYjIv/7Q2bxvHbnMvmN/1Fmz6FQXQ675mIzN+rGGznB2eTTSzdVhLu7axnSlSVX1B8vORGWVE5BHZ+KGQWTZleI7qH/B4wBrA1yx/NKuz+Bw3v5gE01C+BbByl0WQ6tklBcNqLDUJTUp6sTnztxkjSuu7eWvPzxzNttmggFNT0OnRFJ5MGwo3Mjrx/h/WI9zPWuEvH1Cjs3azb0wZUuQc/3iATc0OtErjQBMOKTX/2wgZ0kOc8li+qO+W8MgFuxhEDy6vYZpEXU0mTvPoTCcjZK8BId9wf3WUm6W8cq8+gcz8o+h/ja7ZoLataJWt8c3mP14A2kyVSqh2M6vciWw6MKas2E3L2ZG4ot25YOfCEnuNbvzl/tzhsL/gQ6YRKOJLsouof8wKboXjxFdIMG8w9poyJkcIYF2pu6+8RYsfNnx8QS6b2TPP+MNZfsq/Uxm70=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(26005)(6512007)(186003)(53546011)(508600001)(6506007)(2616005)(86362001)(66946007)(91956017)(66446008)(33656002)(8936002)(36756003)(66556008)(66476007)(5660300002)(64756008)(38070700005)(122000001)(8676002)(4326008)(316002)(2906002)(76116006)(71200400001)(6486002)(54906003)(6916009)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1RwNnM3aEMxZHZDVEZQT3cxMDNjSHc1aDVLaWJDTkcySkFzbTdtRjdjT2gx?=
 =?utf-8?B?ZTFYMk1kSm56NENHQXUxUzVleHFMbThONUc4MVRqNmdwNGRVZlFTb2srSHVJ?=
 =?utf-8?B?MmFOTjhDNncwaXVxeGdwbmd4MEJ6dkhReHdVZkVkeW9TQ3EzK25kWUNzT3N1?=
 =?utf-8?B?Tk03SlNZSTc3SStnVDVmM3ZCcDhzcmxtVkgvMmw2Y1hTSy91TXlMYUhUQkJu?=
 =?utf-8?B?c2s4OW1SQjF2YUZDelprclNndkN2TFEzSTB4eEhJNDZKSElSUzQzM3RQNUpt?=
 =?utf-8?B?TXJzajZQUDN2KzBxRW9TTmZUYno5MDBGMXlCbzVaTkdGMWtwR1JsVGNqdUpL?=
 =?utf-8?B?bVgzZHhJanR1c05oMFRSNE0wN3g4aHNoaWp2UXZpc2dhem5BSWFaSDllQ0hv?=
 =?utf-8?B?RURJTW9vazlRdXlxT0dIK09wclQ5OGxOc1NiQVJOTUpNUHNET3B1emlRTzU2?=
 =?utf-8?B?TjdDT3ZvKytzTCtscGw1eGZZbnBHZkRVODQxT29jZFNhRG5YOCtuSk4zS2pw?=
 =?utf-8?B?VStxUXpoK3VtOUtPSytWbGkyUjJZUUJiRllFTkxBUHNkOXF6Sm9CQXNKMXdB?=
 =?utf-8?B?RXAwZzNLZGkzSkdMSy9FRURIbDNNbzVTN3VJNDJxWUNHMG04cmZ5d3dUVjBm?=
 =?utf-8?B?alo2R1VKYTRoV1c0VVZzRm9TYTdQNmNMMGZ1ZEphWnAxc05aTk4xMGlHZXpG?=
 =?utf-8?B?bHh6OGVCcG5NKzFTOVBWRy9Sa0dXUi81ZjJEYXEzRXpqd09tZkNtcUtzVzUy?=
 =?utf-8?B?L1N1MDBMOXVCRVBJQURaRlZibzFnSGVZTU1nOGpPYURLeXNjb21NaFFIT2hT?=
 =?utf-8?B?UHdEQm1pa0ZyM1RkV0xoY0wwU0NBbVhNLzhkMFVEcVhDN3dLekxuaTFSY3NZ?=
 =?utf-8?B?aVBQOVcrUTc2ekxvNWhvWGJjSEkxNDM4SzVaNnh3Rll2Vy9oSzhLdjZ5VnRa?=
 =?utf-8?B?NEp4S1NJNUtKaXVGYnBTVXB4emV2UEFPZlMvbUVQazJ4cUpwNnR1RXBXaFI1?=
 =?utf-8?B?aW1mQUVVSWpLTjR1ZHRZd2pXWGhocHFzRXFhYys5NkQ2aDdnck5ucTBnVWRW?=
 =?utf-8?B?TGovSmRoM1FteUdHbG9ycDk3K3pwNlBKSmcram1LNHFmdllkV3N5emJhSlNk?=
 =?utf-8?B?NVdNLzBoelFRUGp0bjlpdHpjaElYS1FwTk1pUDhDQnoxVFd5VHhlSHd0YnFh?=
 =?utf-8?B?bzM5WWs3R0RGaFNWK2taaWRzRUxYZDIrWFJxaXo1SVFBdkcvVWJZRmY1em1l?=
 =?utf-8?B?SXBFY0hPbDc2a3YrQ3dlRmNFcEFnOWE4TFJOUzJiT3BnMmF0Ry9FOTNBT2k0?=
 =?utf-8?B?bEVKZmNXdmtldnNrakhUcElncm9Od0pOU1M4S0RPbnJCN1lBREF0VVFEQ1Qr?=
 =?utf-8?B?MHlpV0txTWx4d3FCOEQwR2dHNER6L2xuU3BDd1hodFNiYjI3TUh5eWlSTEhM?=
 =?utf-8?B?cEhnWWxVVWNnRUFRc0xuWnkyR3JQZm5aZlNoeDZsZHg2d1ZjcHR5YngyZFlR?=
 =?utf-8?B?ekJhSnYxbUtJZGU0THRHREZiRTFaR1dBNnlWM3ZiSGgvUGg5S202cG5PeUc4?=
 =?utf-8?B?ZnMwZ0RZUDVhVCtINkF2RXdlZ3pUOU9QRGZaS01SNlNxR0FISlRYOExYSFls?=
 =?utf-8?B?cmxCdG9RNVFxM2hmeDY0OXNzYUEyUUlhUW1FU252eXlzMHRiOEdDaWdRMjR5?=
 =?utf-8?B?Mit2QTRqR3NQK25kSkVkaUFJRE9YV2lvYlN4Vmx6U0FyRWRZeERHYXpkYnpu?=
 =?utf-8?B?N2RnUEowMldmNmlwZnBlZnpYbDY1R1BwN3B6MGtvbE81MnVlWFJ2cDRLWHo3?=
 =?utf-8?B?d3FKeVJORkJwLyt4Ykh4YTRJVGRWSlNxNnZZNVhkd05Oc0pQU1ozQ1AvU2t1?=
 =?utf-8?B?UGxDMWRSMlA1YUtGdEVtUVJoRmsrNWs5MEFtekp2L0FGMHB0dDhYTE16NVBs?=
 =?utf-8?B?NFh3N1lyYkpTODIvanVHKzJNQnlyTEhHcjNudXJiRHl1Y01NNmVSaUlINU82?=
 =?utf-8?B?N1F3eEltdGg2NEFWYUN3cFZjaC93bFQ5Y0JERFBWN2l0Q0NTWXliM3d3N1NQ?=
 =?utf-8?B?cEtlN2JuZTJRcEQ0YTZyZDJRZVkxeWRtV3ozQi85MkJoajhIdEYvQ09EOUFh?=
 =?utf-8?B?Rnp2VndiQkEvQjJWU2o3YXVSd1FiR20vZVVNb1FRSUVkSmNuWFVBc2tHRFp1?=
 =?utf-8?B?N3Y1TVA2NGt6VCtZZENIRGl3OFN3QVBPMU5CUlpjRCt0SXNnOUFZNjh4TGNF?=
 =?utf-8?B?Um9PYjlLUFU0aEx2UUhIUG5HRDVKNGF1ODVUZFd6M0MrUUxISHR3dmN4d3E3?=
 =?utf-8?B?STBUSTBqbUlmRkMwN1ZwYUxUZjNLd0VLSEJJczA4QXQwamVHd3NOdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F85440DB2456C6498C7C5F4747691A15@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b0d19b-e7dc-4dec-cbe4-08da456ec8fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 14:38:54.6632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Idxcp6zaqRG/A/NJB3Rm8+lnhCIrsbT/eMu5WYSbK6Ct5SC0RZPYrDBKYfMzGGXgb6zWyAxSb90/ArkYVzL1Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR05MB7174
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
Cc: Martin Krastev <krastevm@vmware.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gSnVuIDMsIDIwMjIsIGF0IDEwOjMyIEFNLCBTaW1vbiBTZXIgPGNvbnRhY3RAZW1l
cnNpb24uZnI+IHdyb3RlOg0KPiANCj4g4pqgIEV4dGVybmFsIEVtYWlsDQo+IA0KPiBPbiBGcmlk
YXksIEp1bmUgM3JkLCAyMDIyIGF0IDE2OjI3LCBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29t
PiB3cm90ZToNCj4gDQo+Pj4gSW4gcGFydGljdWxhcjogc2luY2UgdGhlIGRyaXZlciB3aWxsIGln
bm9yZSB0aGUgS01TIGN1cnNvciBwbGFuZQ0KPj4+IHBvc2l0aW9uIHNldCBieSB1c2VyLXNwYWNl
LCBJIGRvbid0IHRoaW5rIGl0J3Mgb2theSB0byBqdXN0IGV4cG9zZQ0KPj4+IHdpdGhvdXQgb3B0
LWluIGZyb20gdXNlci1zcGFjZSAoZS5nLiB3aXRoIGEgRFJNX0NMSUVOVF9DQVApLg0KPj4+IA0K
Pj4+IGNjIHdheWxhbmQtZGV2ZWwgYW5kIFBla2thIGZvciB1c2VyLXNwYWNlIGZlZWRiYWNrLg0K
Pj4gDQo+PiBJIHRoaW5rIFRob21hcyBleHByZXNzZWQgb3VyIGNvbmNlcm5zIGFuZCByZWFzb25z
IHdoeSB0aG9zZSB3b3VsZG7igJl0DQo+PiB3b3JrIGZvciB1cyBiYWNrIHRoZW4uIElzIHRoZXJl
IHNvbWV0aGluZyBlbHNlIHlvdeKAmWQgbGlrZSB0byBhZGQ/DQo+IA0KPiBJIGRpc2FncmVlZCwg
YW5kIEkgZG9uJ3QgdW5kZXJzdGFuZCBUaG9tYXMnIHJlYXNvbmluZy4NCj4gDQo+IEtNUyBjbGll
bnRzIHdpbGwgbmVlZCBhbiB1cGRhdGUgdG8gd29yayBjb3JyZWN0bHkuIEFkZGluZyBhIG5ldyBw
cm9wDQo+IHdpdGhvdXQgYSBjYXAgbGVhdmVzIGV4aXN0aW5nIEtNUyBjbGllbnRzIGJyb2tlbi4g
QWRkaW5nIGEgY2FwIGFsbG93cw0KPiBib3RoIGV4aXN0aW5nIEtNUyBjbGllbnRzIGFuZCB1cGRh
dGVkIEtNUyBjbGllbnRzIHRvIHdvcmsgY29ycmVjdGx5Lg0KDQpJ4oCZbSBub3Qgc3VyZSB3aGF0
IHlvdSBtZWFuIGhlcmUuIFRoZXkgYXJlIGJyb2tlbiByaWdodCBub3cuIFRoYXTigJlzIHdoYXQg
d2XigJlyZSBmaXhpbmcuIFRoYXTigJlzIHRoZSByZWFzb24gd2h5IHRoZSB2aXJ0dWFsaXplZCBk
cml2ZXJzIGFyZSBvbiBkZW55LWxpc3RzIGZvciBhbGwgYXRvbWljIGttcy4gU28gbm90aGluZyBu
ZWVkcyB0byBiZSB1cGRhdGVkLiBJZiB5b3UgaGF2ZSBhIGttcyBjbGllbnQgdGhhdCB3YXMgdXNp
bmcgdmlydHVhbGl6ZWQgZHJpdmVycyB3aXRoIGF0b21pYyBrbXMgdGhlbiBtb3VzZSBjbGlja3Mg
bmV2ZXIgd29ya2VkIGNvcnJlY3RseS4NClNvLCB5ZXMsIGNsaWVudHMgbmVlZCB0byBzZXQgY3Vy
c29yIGhvdHNwb3QgaWYgdGhleSB3YW50IG1vdXNlIHRvIHdvcmsgY29ycmVjdGx5IHdpdGggdmly
dHVhbGl6ZWQgZHJpdmVycy4NCg0KDQo+Pj4gT24gVGh1cnNkYXksIEp1bmUgMm5kLCAyMDIyIGF0
IDE3OjQyLCBaYWNrIFJ1c2luIHphY2tAa2RlLm9yZyB3cm90ZToNCj4+PiANCj4+Pj4gLSBhbGwg
dXNlcnNwYWNlIGNvZGUgbmVlZHMgdG8gaGFyZGNvcmUgYSBsaXN0IG9mIGRyaXZlcnMgd2hpY2gg
cmVxdWlyZQ0KPj4+PiBob3RzcG90cyBiZWNhdXNlIHRoZXJlJ3Mgbm8gd2F5IHRvIHF1ZXJ5IGZy
b20gZHJtICJkb2VzIHRoaXMgZHJpdmVyDQo+Pj4+IHJlcXVpcmUgaG90c3BvdCINCj4+PiANCj4+
PiBDYW4geW91IGVsYWJvcmF0ZT8gSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBt
ZWFuIGhlcmUuDQo+PiANCj4+IE9ubHkgc29tZSBkcml2ZXJzIHJlcXVpcmUgaW5mb3JtYXRpb25z
IGFib3V0IGN1cnNvciBob3RzcG90LCB1c2VyIHNwYWNlDQo+PiBjdXJyZW50bHkgaGFzIG5vIHdh
eSBvZiBmaWd1cmluZyBvdXQgd2hpY2ggb25lcyBhcmUgdGhvc2UsIGkuZS4gYW1kZ3B1DQo+PiBk
b2VzbuKAmXQgY2FyZSBhYm91dCBob3RzcG90cywgcXhsIGRvZXMgc28gd2hlbiBydW5uaW5nIG9u
IHF4bCB3aXRob3V0DQo+PiBwcm9wZXJseSBzZXQgY3Vyc29yIGhvdHNwb3QgYXRvbWljIGttcyB3
aWxsIHJlc3VsdCBpbiBhIGRlc2t0b3Agd2hlcmUNCj4+IG1vdXNlIGNsaWNrcyBoYXZlIGluY29y
cmVjdCBjb29yZGluYXRlcy4NCj4+IA0KPj4gVGhlcmXigJlzIG5vIHdheSB0byBkaWZmZXJlbnRp
YXRlIGJldHdlZW4gZHJpdmVycyB0aGF0IGRvIG5vdCBjYXJlIGFib3V0DQo+PiBjdXJzb3IgaG90
c3BvdHMgYW5kIG9uZXMgdGhhdCBhYnNvbHV0ZWx5IHJlcXVpcmUgaXQuDQo+IA0KPiBPbmx5IFZN
IGRyaXZlcnMgc2hvdWxkIGV4cG9zZSB0aGUgaG90c3BvdCBwcm9wZXJ0aWVzLiBSZWFsIGRyaXZl
cnMgbGlrZQ0KPiBhbWRncHUgbXVzdCBub3QgZXhwb3NlIGl0Lg0KDQpZZXMsIHRoYXTigJlzIHdo
YXQgSSBzYWlkLiBUaGVyZeKAmXMgbm8gd2F5IHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiBhbWRn
cHUgdGhhdCBkb2VzbuKAmXQgaGF2ZSB0aG9zZSBwcm9wZXJ0aWVzIGFuZCB2aXJ0aW9fZ3B1IGRy
aXZlciBmcm9tIGEga2VybmVsIGJlZm9yZSBob3RzcG90IHByb3BlcnRpZXMgd2VyZSBhZGRlZC4N
Cg0Keg==
