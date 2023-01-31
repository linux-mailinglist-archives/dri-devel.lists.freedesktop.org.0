Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF196829CA
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 11:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574B910E183;
	Tue, 31 Jan 2023 10:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A06710E31A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 10:00:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keaY46pIArHgEolRzfFJgzMD+CC6cSsI1KQP147olWYgFMnuzXWQNTwO0888tG9TT94U8QcuEuyYabWpbGPkaHQSw5fxCoqOBO5tzpcRr8oykejs5ieYpa6SBPtajyI9MS2+ASejDxcdFKrj3tgWCPV1QdWPt18OtdI1YKd6vH53OijjWssvU6gsODtY3dd/uWvdeLLZ8gqTLKsEF71M4HmNE5ZSEW/gds15o/+m5D+mwQqFzCER++l2afdID8R6U0qg1Qf7eUJEu7lvaHkI8ljGc2CvHdCJbb2nLHhYcca2aicaicJtzbs8RJFx0wsqe8jQCuSWLDovQ3SvY/NZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieU/abhlt6gdeQjuJBDwaFFML3axXZioY0EUbzHyIfc=;
 b=nQky++Li0MwgVh5NrnMiIqBq6oT/wdgtm+qfXWuwTVzsBTsbgGKgwyYdbWjwp4bH7JWv9A5HCdwApuPttD50PzypVI5caBCAwxadwoLomtzj0DvbANQYqUyxWh7kVVW6wyhSdEnnXjAtGg0R0jZh3qd4iwcx8nTdSqNViIP+6ElQ2sAnh9saSw58+B5fGZV1tnnPv7aGQmDxa5yGONXDMJMEq6xTstqqFyz7QKyR4D14J5xczcV17lRUCybZQJ175PhXUQyV/0J+ObXjHn6ohtH7J7IcGGLGJkCrwJJHNAdBtsnoX0886FU7NN+VlpqllarGVgjFzEylBzGYWXv8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieU/abhlt6gdeQjuJBDwaFFML3axXZioY0EUbzHyIfc=;
 b=cupPHgs+z5M61QPxWX7pDnzEozCZulNPHvtNyUOynvtdS8cDLXa670Tnz6UPjQVqSE9JC2f37c018U1q9gbalTGtUcbxdkAr1e/HnNVPUEUXP7O4dDTo6oyJwrrK7bNALOI3OgUA83T9+oKzf0Y48fHgyFHcULdULGPP9FGkwgo=
Received: from BYAPR12MB3094.namprd12.prod.outlook.com (2603:10b6:a03:db::23)
 by MW4PR12MB7117.namprd12.prod.outlook.com (2603:10b6:303:221::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.28; Tue, 31 Jan
 2023 10:00:43 +0000
Received: from BYAPR12MB3094.namprd12.prod.outlook.com
 ([fe80::e800:5772:724a:9f3f]) by BYAPR12MB3094.namprd12.prod.outlook.com
 ([fe80::e800:5772:724a:9f3f%7]) with mapi id 15.20.6043.023; Tue, 31 Jan 2023
 10:00:43 +0000
From: "Slivka, Danijel" <Danijel.Slivka@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: RE: Amdgpu module is references even after unbinding the vtcon
Thread-Topic: Amdgpu module is references even after unbinding the vtcon
Thread-Index: AQHZL/3qtbvFlTJgckOb8U/DMYMJ/K6vi9yAgADmv1CAAC6AgIAAF0sAgAAH0ICAB5OcsA==
Date: Tue, 31 Jan 2023 10:00:42 +0000
Message-ID: <BYAPR12MB309439415E4F6A71AADCE0BC98D09@BYAPR12MB3094.namprd12.prod.outlook.com>
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <95f2314b-5d55-f2ca-468b-2f127571bd77@suse.de>
 <BYAPR12MB309405AD969A1EAA1EA84BC198CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
 <6f234925-9934-53d7-ca9f-6b5bc6a67ee6@gmail.com>
 <BYAPR12MB3094B0D8166231D88609CA6998CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
 <0e985a2e-8bd8-c488-6a21-15a57fb1720a@gmail.com>
In-Reply-To: <0e985a2e-8bd8-c488-6a21-15a57fb1720a@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=5d3f0500-f69c-411f-b791-8a34b461ef0c;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-01-31T09:53:43Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3094:EE_|MW4PR12MB7117:EE_
x-ms-office365-filtering-correlation-id: 61f34db0-4361-4018-22a0-08db037203bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DWGWuBvHHjIKXb0IWNNBnEFr8T2PgxAdfsy3WvJFYs8Q8iu58Egm8M86oqs4F2QuaOOUzO/q9czzGk0oBigV7UZovmZ+bIfYnAF8n3lCrpc705g9M2QfVwqXk3YYkTMEY8ekLrqxN8RXsMgHsNMgy0oP/+jVQM6Rfi3ld50qcv2E3/9ZrOMywv3XxGdjksaHaBBO3ZFb0qBTCa777GApusXYKuGIejNKv+xoVLyLMzmrjdjpVLN4Xfd5vvYGguDcWqX1XvetGBxaV610RaWEUFyPv2FHmy/UWWuFePWTG/eoCE0oBrktObmgrTERIbRw9Zd7Jygo4125NYJoZKuj2RRSGuzAt8wgm+0EZvhfBdGQ+Nj25VYJWqYosAbSR9xZOtznP95Uu5Bj/xPXDokVm4z6FYy06V1KihkoMIZ9vY9hkByBK9WH2uxbbor2hp775BirhYrcyzi8tAKqtM54yjHd5nB2epdPnfavTkZZcK9hTwmTi3LadMEnsajobpibBWhVLlusQYJjFM+REPA1yhJd8OaZExrL591xypzONu91rbIoNDdPVZZ6Sm3tySk1cP+NkUABLdR+DRCXEl92f81YfOUDGaY9E5Qp7olu/eXN2HeEUik+1ifsjylz0oHwGzn1TXA6Hf0lxJN4w/4MlKRjgLCdrZJu9HzIANhUTir8XgU6EcHC6FrQdnCWFU7gGC/hGVZmQnLQrAdkaI7GeBOqtU3EKAUfkDPgv+6Tg3E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3094.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199018)(66556008)(66446008)(76116006)(66476007)(64756008)(4326008)(66946007)(41300700001)(8936002)(8676002)(52536014)(5660300002)(2906002)(54906003)(55016003)(316002)(38070700005)(33656002)(71200400001)(110136005)(83380400001)(26005)(7696005)(478600001)(966005)(86362001)(122000001)(6506007)(9686003)(53546011)(186003)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm1tTEd4Yjc4c0U2NTdPMmliZUNnYzFjQ3NNWEJ6S0pPS2NIRnVrNyt1MDJW?=
 =?utf-8?B?ZHI5Uk1PUDJ3amg2ak9reGRxYjJ2Yk9uNG1DNWlCLzVOd3h5Y0dUYVFDdmpm?=
 =?utf-8?B?TEswcXVMTCtkaXEyUy9qSTJ2YmxKQWY1enpxdWw3ZVJNMHpEZ01LZTZ5VVZm?=
 =?utf-8?B?MWZZam5yZ05LbnF3aDRhNVppQy9qSTJ4Vi9tdk5HTTlLRGs3dUFNMnA1SUxY?=
 =?utf-8?B?dlM5SjJqbFJwcEl4L0RYdFpIUmxtL2xBTWQ4ME5KK0haSVUwSkZiNForaXJQ?=
 =?utf-8?B?WndWNEFFaHdLYmI3YmNjZXhVWEtJa2dsalhiY3RZaWQzM0Y2ZGlvYXZ5cmZV?=
 =?utf-8?B?cE1hVVY5MzFCN0plVGdqb3ZKamNnTk13a3d0cFdheGNrcTB1U083SUlGZGlP?=
 =?utf-8?B?ZFd6K1loOEZqYnBReCtPNFV2UXJZMEJXQnJhMVd5TTFhZjdhWjR4L3hCejh0?=
 =?utf-8?B?eU5jemtnSWZHOWFQR243ZzI5eURMaDJibys3eUcvQW9oNnhzVEtUeHBlUm5N?=
 =?utf-8?B?UDNBR1l4eWZlU1pTakU4VGZ6S0s2MWJqTnpaVFdJY1A4QUV4WmZtelNnSmtp?=
 =?utf-8?B?T3BjR0J4bWJOSm1xS3ZUUzdrVnZjbjgvN1NmaUdWYWlHb3JwbzhNR3djTDlw?=
 =?utf-8?B?U0VqWEd1Q0dabjl5NTBsSzQ3SHZkc3NJcVp3V1R5VDhoOGhWK1J1dEwvWjI5?=
 =?utf-8?B?eGtodUlBZ2pOSkJtWXZ3VXlES0FhNjhxRnFyelNnbnJFemc3dEtUSWhJOW9C?=
 =?utf-8?B?cnZqbnp5UnJhM25TNWdFZ3BiR29IL1c4RVRvQnlyYnJ1QnlEalJkYW5HMFlH?=
 =?utf-8?B?bTJ6cXdybndwTkpYZTZGSG5Ea1NHN3N4NVYvS3lhN20zUDBqUis1bUZ0ZEd5?=
 =?utf-8?B?WGpQVHEzUjRHVlFmS2h6cGIyZEJkWmVUTkZINGVrUi9nV1N5c2tGb09VQnEw?=
 =?utf-8?B?VzVyVUI3T2VMVUpQcUVKeVdGV1JXNjVRRkVheE5oN2V5STVHd0M2ejRSMUVs?=
 =?utf-8?B?UTVKTVNzdURYcW1UUmx1dGU3TUVlQk82dU11bHVDY0pYbVBDTlptQ3BtVVpH?=
 =?utf-8?B?KzJkWnlEeGI0NXB6NlI4U2g2TkV6SzdvN2o4Znd2OWNaMzFWS3JKQStMbjFw?=
 =?utf-8?B?NmNRRnhOajdEdjhwb0tWemYvNXcwajVlS1pTbWRKSkhTWG0vcXNYNWQ4ZGx6?=
 =?utf-8?B?YnFpbTJZVWg3SHdQR29BUXRjSnh1L3hYc1k0ZGw1dUtVOVZTK1NCQkN1dnBG?=
 =?utf-8?B?dUhRdElHMytMRkhJRy9VYXpQbXprbTFHTzVqTWNybzU4QzlYUlRDOS9tRkJn?=
 =?utf-8?B?bzZlNVRYSWhvTHBiWnFZWmNyVkdyUStlSHZxTm9OSHV4STNyRCtFdUhlajFE?=
 =?utf-8?B?dUMrSzZJVkJVWTl5ZkFjOGtiUFVMT0xyd1RaVkp1cms3d29NbTUzZitkekZI?=
 =?utf-8?B?ZEhPSWJpNjZzMENobm9KQXBqTGdkY3hLR1ZqZlVMQmU4T2hlY0VEOUxramw1?=
 =?utf-8?B?dVdZcVBWSk9va1B3TThrMENTWnRqdnBRZ1Y4VmhnM2JMeHc1aDlzaTRseEpC?=
 =?utf-8?B?OWN0UG9PWUFUWEVzeFY0cTdSQ1lnWkFsL2gxYVRCTDJGYlZmTjBYd0JaTjQv?=
 =?utf-8?B?YnBOQldqVm1rU3liempFanlHZG1uQmRwc2pFOGptNUhCZ0pNOU1Yd0VaM3Zl?=
 =?utf-8?B?eUZ1T3Q3eThUQTNuWDZRdG9hR2RJN1dVK3gxWEtiRDd4enVXSk5DYXN2SGJO?=
 =?utf-8?B?UHhoOWdqNWJ6SGU0bklicnpsUHJJU2FIdzY5dkI4dkF0eVlMYWxIK0tBdzgy?=
 =?utf-8?B?QVovQ2E4Rzd4czdubHJiR3dxTHdJYkxsZ1VaL0pPeWdHTS9WbHk2OHpsQVFT?=
 =?utf-8?B?WFdhaFdBZjNqQ0tWTW90ZHp1QllTTmtaekNlMUpycS9RSWFKVmUyOEhObWlT?=
 =?utf-8?B?Mjg0cjdkZm5EMmM3cnpYZ1lNa0dwWUl6aHEzVngxVHJUNFNZT05KQ3hWRXhm?=
 =?utf-8?B?ZWFENEIzVE0zZnRkZ0tZOEtWRUhnNStTbmd5L3JJZUZFVTQwb3hFTklra1U0?=
 =?utf-8?B?dGY5eDRXYWhyN0xMUWFPbGJNeTBYd1lrNFF5U0NPblY4cHA5Uk9memU3eTdz?=
 =?utf-8?Q?xHgo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3094.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f34db0-4361-4018-22a0-08db037203bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 10:00:42.6445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bYVzke5DbcqM/7jf5Wx1w+oaGtoD1QP47ItO6I/tnFfRlKJYs59gC4UBdMPKhf7DF5OBM0jxJyYQccAX+SMw5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7117
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhpIENocmlzdGlhbiwNCg0KSSB3
YXMgbm90IGFibGUgdG8gY2hlY2sgYWJvdXQgdGhlIGhhbmRvdmVyIGZyb20gZmJkZXYgdG8gZ2Rt
IGFzIEkgd2FzIGhhdmluZyBpc3N1ZXMgd2l0aCBzZXR0aW5nIGl0IHVwIHByb3BlciBkcml2ZXIg
aW4gdGhlIGVudmlyb25tZW50IHdpdGggZGlzcGxheS4NClJlZ2FyZGluZyBleHBvcnRpbmcgRE1B
LWJ1Ziwgd2hlbiB0aGUgWCBzdGFydHMgaXQgYWNxdWlyZXMgZmlsZSBkZXNjcmlwdG9yIGZvciB0
aGUgYnVmZmVyIHdpdGggY3JlYXRpbmcgbmV3IGhhbmRsZSBhbmQgd2hlbiBjbG9zaW5nIHRoZSBm
aWxlICBkZXNjcmlwdG9yIGl0IHN1Y2Nlc3NmdWxseSByZWxlYXNlcyB0aGUgZG1hIGJ1ZmZlciB0
aGF0IHdhcyBleHBvcnRlZCBhcyBpdCBpcyB0aGEgbGFzdCBoYW5kbGUgb24gdGhlIHVuZGVybHlp
bmcgb2JqZWN0Lg0KDQpCUiwNCkRhbmlqZWwNCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5j
b20+DQo+U2VudDogVGh1cnNkYXksIEphbnVhcnkgMjYsIDIwMjMgMzoxMiBQTQ0KPlRvOiBTbGl2
a2EsIERhbmlqZWwgPERhbmlqZWwuU2xpdmthQGFtZC5jb20+OyBUaG9tYXMgWmltbWVybWFubg0K
Pjx0emltbWVybWFubkBzdXNlLmRlPg0KPkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRl
ci5EZXVjaGVyQGFtZC5jb20+OyBkcmktZGV2ZWwgPGRyaS0NCj5kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc+OyBTaGFybWEsIFNoYXNoYW5rDQo+PFNoYXNoYW5rLlNoYXJtYUBhbWQuY29tPg0K
PlN1YmplY3Q6IFJlOiBBbWRncHUgbW9kdWxlIGlzIHJlZmVyZW5jZXMgZXZlbiBhZnRlciB1bmJp
bmRpbmcgdGhlIHZ0Y29uDQo+DQo+SGkgRGFuaWplbCwNCj4NCj5jYW4geW91IGFsc28gZG91Ymxl
IGNoZWNrIHRoYXQgR0RNL1ggaXMgc3RpbGwgY2FwYWJsZSBvZiBhY3F1aXJpbmcgYSBETUEtYnVm
DQo+ZmlsZSBkZXNjcmlwdG9yIGZvciB0aGUgYnVmZmVyIChlLmcuIHRoYXQgd2UgaGF2ZSBhIERN
QS1idWYgaGFuZGxlIGZvciBpdCB3aGlsZQ0KPnRoZXkgYXJlIHN0YXJ0ZWQpLg0KPg0KPkFuZCB0
aGF0IGhhbmRvdmVyIGZyb20gZmJkZXYgdG8gR0RNL1ggaXMgZmxpY2tlciBmcmVlPw0KPg0KPlRo
YW5rcywNCj5DaHJpc3RpYW4uDQo+DQo+QW0gMjYuMDEuMjMgdW0gMTQ6NDQgc2NocmllYiBTbGl2
a2EsIERhbmlqZWw6DQo+PiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF0NCj4+DQo+
PiBIaSBDaHJpc3RpYW4sDQo+Pg0KPj4gSSBoYXZlIHRlc3RlZCB0aGUgcHJvcG9zZWQgcGF0Y2gs
IHRoZSBpc3N1ZSBpcyBub3QgcmVwcm9kdWNpYmxlIGFuZA0KPmV2ZXJ5dGhpbmcgZWxzZSBzZWVt
cyB0byB3b3JrIGZpbmUuDQo+Pg0KPj4gQlIsDQo+PiBEYW5pamVsDQo+Pg0KPj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4gRnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+DQo+Pj4gU2VudDogVGh1cnNkYXksIEphbnVhcnkgMjYs
IDIwMjMgMToyMCBQTQ0KPj4+IFRvOiBTbGl2a2EsIERhbmlqZWwgPERhbmlqZWwuU2xpdmthQGFt
ZC5jb20+OyBUaG9tYXMgWmltbWVybWFubg0KPj4+IDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+
IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBkcmkt
ZGV2ZWwgPGRyaS0NCj4+PiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBTaGFybWEsIFNo
YXNoYW5rDQo+Pj4gPFNoYXNoYW5rLlNoYXJtYUBhbWQuY29tPg0KPj4+IFN1YmplY3Q6IFJlOiBB
bWRncHUgbW9kdWxlIGlzIHJlZmVyZW5jZXMgZXZlbiBhZnRlciB1bmJpbmRpbmcgdGhlDQo+Pj4g
dnRjb24NCj4+Pg0KPj4+IEFtIDI2LjAxLjIzIHVtIDEwOjQ5IHNjaHJpZWIgU2xpdmthLCBEYW5p
amVsOg0KPj4+PiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF0NCj4+Pj4NCj4+Pj4g
SGkgVGhvbWFzLA0KPj4+Pg0KPj4+PiBJIGhhdmUgY2hlY2tlZCB3aGF0IHlvdSBtZW50aW9uZWQu
DQo+Pj4+IFdoZW4gbG9hZGluZyBhbWRncHUgd2UgY2FsbCAgZHJtX2NsaWVudF9pbml0KCkgZHVy
aW5nIGZiZGV2IHNldHVwDQo+Pj4+IFsxXSwgdGhlDQo+Pj4gcmVmY250IGZvciBkcm1fa21zX2hl
bHBlciBpbmNyZWFzZXMgZnJvbSAzIC0+IDQuDQo+Pj4+IFdoZW4gd2UgdW5iaW5kIHZ0Y29uLCBy
ZWZjbnQgZm9yIGRybV9rbXNfaGVscGVyIGRyb3BzIDQgLT4gMywgYnV0DQo+Pj4+IHRoZQ0KPj4+
IGRybV9jbGllbnRfcmVsZWFzZSgpIFsyXSBpcyBub3QgY2FsbGVkLg0KPj4+PiBUaGUgZHJtX2Ns
aWVudF9yZWxlYXNlKCkgaXMgY2FsbGVkIG9ubHkgd2hlbiB1bmxvYWRpbmcgdGhlIGFtZGdwdQ0K
PmRyaXZlci4NCj4+Pj4NCj4+Pj4gSXMgdGhpcyBleHBlY3RlZD8NCj4+PiBZZXMsIHRoZSBjbGll
bnQgY2FuJ3QgYmUgcmVsZWFzZWQgYmVjYXVzZSBpdCBpcyBwb3NzaWJsZSB0aGF0IHRoZQ0KPj4+
IHZ0Y29uIGlzIGJvdW5kIHRvIHRoaXMgZmJkZXYgYWdhaW4uDQo+Pj4NCj4+PiBQbGVhc2UgdGVz
dCB0aGUgaGFuZGxlIHdvcmsgYXJvdW5kIEkndmUgc2VuZCBhcm91bmQgaW50ZXJuYWxseS4gQXQN
Cj4+PiBsZWFzdCBmb3IgbWUgdGhhdCBhcHByb2FjaCBzZWVtcyB0byB3b3JrLg0KPj4+DQo+Pj4g
UmVnYXJkcywNCj4+PiBDaHJpc3RpYW4uDQo+Pj4NCj4+Pj4gVGhlcmUgaXMgYSBjb21tZW50IGZv
ciBkcm1fY2xpZW50X3JlbGVhc2Ugd2l0aCByZWdhcmRzIHRvIGZiZGV2IDoNCj4+Pj4gKiBUaGlz
IGZ1bmN0aW9uIHNob3VsZCBvbmx5IGJlIGNhbGxlZCBmcm9tIHRoZSB1bnJlZ2lzdGVyIGNhbGxi
YWNrLiBBbg0KPmV4Y2VwdGlvbg0KPj4+PiAgICAqIGlzIGZiZGV2IHdoaWNoIGNhbm5vdCBmcmVl
IHRoZSBidWZmZXIgaWYgdXNlcnNwYWNlIGhhcyBvcGVuIGZpbGUNCj5kZXNjcmlwdG9ycy4NCj4+
Pj4NCj4+Pj4gQ291bGQgdGhpcyBiZSByZWxldmFudCBmb3Igb3VyIHVzZSBjYXNlLCBhbHRob3Vn
aCBhcw0KPj4+PiBBcHBsaWNhdGlvbi9YL0dETSBhcmUNCj4+PiBzdG9wcGVkIGF0IHRoYXQgcG9p
bnQgYW5kIG5vIGZkIHNob3VsZCBiZSBvcGVuLg0KPj4+PiBUaGFuayB5b3UsDQo+Pj4+IEJSLA0K
Pj4+PiBEYW5pamVsDQo+Pj4+DQo+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+
Pj4gRnJvbTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+Pj4+PiBT
ZW50OiBXZWRuZXNkYXksIEphbnVhcnkgMjUsIDIwMjMgODo0OCBQTQ0KPj4+Pj4gVG86IENocmlz
dGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPg0KPj4+Pj4gQ2M6
IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IFNsaXZrYSwg
RGFuaWplbA0KPj4+Pj4gPERhbmlqZWwuU2xpdmthQGFtZC5jb20+OyBkcmktZGV2ZWwNCj4+Pj4+
IDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgU2hhcm1hLCBTaGFzaGFuaw0KPj4+
Pj4gPFNoYXNoYW5rLlNoYXJtYUBhbWQuY29tPg0KPj4+Pj4gU3ViamVjdDogUmU6IEFtZGdwdSBt
b2R1bGUgaXMgcmVmZXJlbmNlcyBldmVuIGFmdGVyIHVuYmluZGluZyB0aGUNCj4+Pj4+IHZ0Y29u
DQo+Pj4+Pg0KPj4+Pj4gSGkgQ2hyaXN0aWFuDQo+Pj4+Pg0KPj4+Pj4gQW0gMjQuMDEuMjMgdW0g
MTU6MTIgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0KPj4+Pj4+IEhpIFRob21hcywNCj4+Pj4+
Pg0KPj4+Pj4+IHdlIHJhbiBpbnRvIGEgcHJvYmxlbSB3aXRoIHRoZSBnZW5lcmFsIGZiY29uL2Zi
ZGV2IGltcGxlbWVudGF0aW9uDQo+Pj4+Pj4gYW5kIHRob3VnaCB0aGF0IHlvdSBtaWdodCBoYXZl
IHNvbWUgaWRlYS4NCj4+Pj4+Pg0KPj4+Pj4+IFdoYXQgaGFwcGVucyBpcyB0aGUgZm9sbG93aW5n
Og0KPj4+Pj4+IDEuIFdlIGxvYWQgYW1kZ3B1IGFuZCBnZXQgb3VyIG5vcm1hbCBmYmNvbi4NCj4+
Pj4+PiAyLiBmYmNvbiBhbGxvY2F0ZXMgYSBkdW1wIEJPIGFzIGJhY2tpbmcgc3RvcmUgZm9yIHRo
ZSBjb25zb2xlLg0KPj4+Pj4+IDMuIEdETS9YL0FwcGxpY2F0aW9ucyBzdGFydCwgbmV3IGZyYW1l
YnVmZmVycyBhcmUgY3JlYXRlZCBCT3MNCj4+Pj4+PiBpbXBvcnRlZCwgZXhwb3J0ZWQgZXRjLi4u
DQo+Pj4+Pj4gNC4gU29tZWhvdyBYIG9yIEdETSBpdGVyYXRlZCBvdmVyIGFsbCB0aGUgZnJhbWVi
dWZmZXIgb2JqZWN0cyB0aGUNCj4+Pj4+PiBrZXJuZWxzIGtub3dzIGFib3V0IGFuZCBleHBvcnQg
dGhlbSBhcyBETUEtYnVmLg0KPj4+Pj4+IDUuIEFwcGxpY2F0aW9uL1gvR0RNIGFyZSBzdG9wcGVk
LCBoYW5kbGVzIGNsb3NlZCwgZnJhbWVidWZmZXJzDQo+Pj4+Pj4gcmVsZWFzZWQgZXRjLi4uDQo+
Pj4+Pj4gNi4gV2UgdW5iaW5kIHZ0Y29uLg0KPj4+Pj4+DQo+Pj4+Pj4gQXQgdGhpcyBwb2ludCB0
aGUgYW1kZ3B1IG1vZHVsZSB1c3VhbGx5IGhhcyBhIHJlZmVyZW5jZSBjb3VudCBvZiAwDQo+Pj4+
Pj4gYW5kIGNhbiBiZSB1bmxvYWRlZCwgYnV0IHNpbmNlIEdETS9YL1dob2V2ZXIgaXRlcmF0ZWQg
b3ZlciBhbGwgdGhlDQo+Pj4+Pj4ga25vd24gZnJhbWVidWZmZXJzIGFuZCBleHBvcnRlZCB0aGVt
IGFzIERNQS1idWYgKGZvciB3aGF0ZXZlcg0KPj4+Pj4+IHJlYXNvbg0KPj4+Pj4+IGlkaykgd2Ug
bm93IHN0aWxsIGhhdmUgYW4gZXhwb3J0ZWQgRE1BLWJ1ZiBhbmQgd2l0aCBpdCBhIHJlZmVyZW5j
ZQ0KPj4+Pj4+IHRvIHRoZQ0KPj4+IG1vZHVsZS4NCj4+Pj4+PiBBbnkgaWRlYSBob3cgd2UgY291
bGQgcHJldmVudCB0aGF0Pw0KPj4+Pj4gSGVyZSdzIGFub3RoZXIgc3RhYiBpbiB0aGUgZGFyay4N
Cj4+Pj4+DQo+Pj4+PiBUaGUgYmlnIGRpZmZlcmVuY2UgYmV0d2VlbiBvbGQtc3R5bGUgZmJkZXYg
YW5kIHRoZSBuZXcgb25lIGlzIHRoYXQNCj4+Pj4+IHRoZSBvbGQgZmJkZXYgc2V0dXAgKGUuZy4s
IHJhZGVvbikgYWxsb2NhdGVzIGEgR0VNIG9iamVjdCBhbmQgcHV0cw0KPj4+Pj4gdG9nZXRoZXIg
dGhlIGZiZGV2IGRhdGEgc3RydWN0dXJlcyBmcm9tIHRoZSBCTyBpbiBhIGZhaXJseSBoYWNraXNo
DQo+Pj4+PiB3YXkuIFRoZSBuZXcgc3R5bGUgdXNlcyBhbiBpbi1rZXJuZWwgY2xpZW50IHdpdGgg
YSBmaWxlIHRvIGFsbG9jYXRlDQo+Pj4+PiB0aGUgQk8gdmlhIGR1bWIgYnVmZmVyczsgYW5kIGhv
bGRzIGEgcmVmZXJlbmNlIHRvIHRoZSBEUk0gbW9kdWxlLg0KPj4+Pj4NCj4+Pj4+IE1heWJlIHRo
ZSByZWZlcmVuY2UgY29tZXMgZnJvbSB0aGUgaW4ta2VybmVsIERSTSBjbGllbnQgaXRzZWxmLiBb
MV0NCj4+Pj4+IENoZWNrIGlmIHRoZSBjbGllbnQgcmVzb3VyY2VzIGdldCByZWxlYXNlZCBbMl0g
d2hlbiB5b3UgdW5iaW5kIHZ0Y29uLg0KPj4+Pj4NCj4+Pj4+IEJlc3QgcmVnYXJkcw0KPj4+Pj4g
VGhvbWFzDQo+Pj4+Pg0KPj4+Pj4gWzFdDQo+Pj4+PiBodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fDQo+Pj4+PiBjbA0KPj4+
Pj4gaWVudC5jI0w4Nw0KPj4+Pj4gWzJdDQo+Pj4+PiBodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fDQo+Pj4+PiBjbA0KPj4+
Pj4gaWVudC5jI0wxNg0KPj4+Pj4gMA0KPj4+Pj4NCj4+Pj4+PiBUaGFua3MsDQo+Pj4+Pj4gQ2hy
aXN0aWFuLg0KPj4+Pj4gLS0NCj4+Pj4+IFRob21hcyBaaW1tZXJtYW5uDQo+Pj4+PiBHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQo+Pj4+PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkggTWF4ZmVsZHN0ci4gNSwgOTA0MDkNCj5Ow7xybmJlcmcsDQo+Pj4+PiBHZXJtYW55IChI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj4+Pj4+IEdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg0K
