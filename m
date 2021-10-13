Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C44CE42C434
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FBB6EA71;
	Wed, 13 Oct 2021 14:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFAC6EA74
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:56:13 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DETsOZ006641; 
 Wed, 13 Oct 2021 14:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=aeQ6NKni9t+FroN2pW5tCvkb/ati7CoqQzJ3J+UqYOI=;
 b=bSVh1vIbwTf43DIynDUYLKrnteHg85AXrDti9YF2d4AGYpx2a2IxaF5EhvPkynhpNFeM
 zQazeYAlNbNJDouluiGwtE1H8MLRiOdatu0aB7/da06NQUcdhfJxoI7QHYQTxPubwJY0
 NYIUc41oLHoFTvTh8cDBLURWcUFfnP+TuOZ7O6QOdnXxX9I6hpM8VMbVA5kdB09NCR/8
 PtbG6A3iCLX9+GmV/6eqV2nu8COxIJYFzSKoYrdc8vm3QOePiXvlO2VJmJ4AiXO+yojS
 MEg/NEIIz+DKKePx5qlH/lqxFXiDEs6qnTujy5JZ2VZHt4XONX8PeHcSXkPeXRv8RKIg 5A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bnkbh4bun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 14:56:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19DEUitM009541;
 Wed, 13 Oct 2021 14:56:10 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by aserp3030.oracle.com with ESMTP id 3bkyxtkmw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 14:56:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbX3m8+2ut4o60+q0QfkLhom+UtZJ14UOGiAKV4yEgKCivd8yCliMEiHAYvDLNbevsNMuIqVAGYWYsLtKyDz6NpxTLlO1HjP6QZnANLrBQaHeTsfMIG1fzwGiVk1bAjDMsdqG8OcMiOV9I1gr+XT5S8fh2PYJqLheu/rQvRnuZbJV7N/exvsjqaV8TMYc9AxNdoyFqU4kVCS2mzbBy7wcYTRCsGjStK0v7cgxQ62Ls7cIxQN2QheP6e5IpYxoLxoXOmxaPCuYMErTIFJu+y6hoswhkavsPIaR9jkjo8xLbu438ZXIZYSgPmE9l3X2tJtCNfESPr4hP0NOc2Tum3TlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aeQ6NKni9t+FroN2pW5tCvkb/ati7CoqQzJ3J+UqYOI=;
 b=dBIgFQGKl0azLp3A85rNOaT5JntJRSt5vUEgbqbq9smZE+T5uDYpgFcAjuINZodhJQwDbmaz6GjdbDM+ajMCADDelOZSi06+Pgm0rmX30deKNuyBl6cR4L1Cu3S52ORB8O2euKK6Udq62MeyVkmLWSqDMu7n2tq4NqLo65GQqURwaNMtSNiFprN1AAXry4uJ5xILualKTkYuY7DOM1mRTNRl6ii59/ZEFedeeZo0b9KQJxp1p7xMaCM461cHh+2egToMINAnULXTKBIw62JZaR1rIWBXRsFQueZFnlrjJi7eQcnH5XRQhNEKvfrzm5Rxun/KJjH3Yre3N4jNbkB7RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeQ6NKni9t+FroN2pW5tCvkb/ati7CoqQzJ3J+UqYOI=;
 b=JMxd8uf8dDlLQBevZVrpv8pSBkym+sG/O3Nvp2+zdy6DLlZFvSqJQeUd+D+KX3jrVBOS/U9trmsBwQF4Uud5Yb9XZRqj1lpI0bhwQVPVJlCmJv8xwTarwfXq0znuqZLrS6BQ4jJEtuPMcjq47hHT8w1FyPkMcprd3IFpaQOpo0k=
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
 by SJ0PR10MB4798.namprd10.prod.outlook.com (2603:10b6:a03:2df::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 14:56:09 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::f4fe:5b4:6bd9:4c5b]) by SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::f4fe:5b4:6bd9:4c5b%6]) with mapi id 15.20.4587.030; Wed, 13 Oct 2021
 14:56:09 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Ainux Wang
 <ainux.wang@gmail.com>
Subject: Re: 572994bf18ff prevents system boot
Thread-Topic: 572994bf18ff prevents system boot
Thread-Index: AQHXuIHb1jcBl5uEwUiwoZESWfnCi6vCbBgAgABr94CAAAlEgIAAAToAgAXvMICACEInAA==
Date: Wed, 13 Oct 2021 14:56:08 +0000
Message-ID: <091125B3-A173-49D7-AD3A-1A73460EF52C@oracle.com>
References: <A194B6CE-AF77-422D-A92F-292ABD83BCCE@oracle.com>
 <eeaf6170-0aca-4466-c79c-b422cdf29179@suse.de>
 <1FA5E09F-BE25-4FF6-9958-7D7B0BE9256B@oracle.com>
 <aaefdfe4-084b-7abd-5e5b-47481e20f4bd@suse.de>
 <BAE78984-959D-480E-A0F7-71CF12FCE831@oracle.com>
 <8f577b6a-3217-5b87-7dc2-eeefafef2f72@suse.de>
In-Reply-To: <8f577b6a-3217-5b87-7dc2-eeefafef2f72@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e728cd2e-ea5c-429b-87d9-08d98e59973f
x-ms-traffictypediagnostic: SJ0PR10MB4798:
x-microsoft-antispam-prvs: <SJ0PR10MB47985EE3F51FF648475ADDF293B79@SJ0PR10MB4798.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xKUirqwuoSjBhHoL/P48duuCNFoy19BFkZjZtDPqfT/UhuBl/EmtQGdOq8te+EAsTa5wnqQI65oU6Re0hgPivwqSskJjwYpDYMw0IijIR8/x1aC9x1xXTLkkQnepd7pCZOewyifr7Dry1rEEdNwuo+g07D2iitAi1yvgVHBDVYosDwYHaJySQyhwE83oFsuMsBRdZgKPSjmTLgUCRQwsWHqLHJclj0yAO4mRbFd2S+1KPAhJS0P6yyYP0LyAoe8/2kPqUpF8Xl7xWcQqwWZWgt5OtIy7c0+sZ8ROaI+HP+/WRvYCAYfjJnL800B7vMj2e1HVVaplIRxwE7QqAZYOCHMrxDz3hxjK1po8jjKlFQMvzy3WIR83nJURZPc/5pto+3wg3TE7nJVZMChZjc4fpz/qjds2VAqd0zVYSu8rRV3QqjUKhq14V+DIYjcCEFLpkGv5kJEeh+ZLhjGUUZBcb/udczNU93QXDAIpqfn8GUvtO/0O4a7mon1ntr/tq1icnvnQx+evnXgaVjcjN1maDv+WQqnX5mKcf2Jh0tby7UtCay+ftjQpkeDDSyFOs2YcMNAg6KSD/0oDv6lBokJFqap8QKXUfbJwjOa0xcUXcoT/zC2opo2/oF3IuwF3yZo53wib2F/h+65ZSVIHioY8GrMltcdL4KUL/1/1fUvju4ZggWZHImImamkzjF4fECUZHt1sPpzo7xETUpuV3Mj+0MYYFMBdqVoilYLBIyN/ElbJBvC6y2KBC6iXaZLc2hUS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4688.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(6506007)(36756003)(66574015)(86362001)(8936002)(91956017)(64756008)(66556008)(38070700005)(66476007)(66446008)(26005)(76116006)(33656002)(6486002)(6512007)(2906002)(186003)(508600001)(66946007)(54906003)(6916009)(5660300002)(4326008)(71200400001)(122000001)(2616005)(83380400001)(8676002)(316002)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0xtc1ZWWGlYNE9vZUNNN3pJRkR0dS9vcjJucy9lbDdBbGdXNHlYbUhPMWN5?=
 =?utf-8?B?TTkwMENTTlFTQitaMUQyWDNFcXVKZFlRQWRQRDFhOGZsUWp1QlBaVzl2SnRM?=
 =?utf-8?B?Z0FtektSS2lEUUdkV1dveHFEaWlsamZkVzNjK3hQTTBpNWY5RWdJM0ZlTlZm?=
 =?utf-8?B?YzRPQSs5R05FWi9wS0pSMmFTYUV3alBLL1p3a3RUcmxxeC94N2pMV2I5R3Yy?=
 =?utf-8?B?QzRFZGlPTlRYSjZCckovMStRNHVibElaVEtJUndvSHZkUUx4Sno5c3p0Wjdj?=
 =?utf-8?B?aktTOW5xV0pQdy84em8wTGx4UU5maHl5NDliKzZwMFNPN2YvMVlVcVZJRmJl?=
 =?utf-8?B?VHNnTUJWRG1NUzk1ekZrTkd4MFFtWE5wY0V6KzV1T2dNTHkxTHJMZGxOeTU0?=
 =?utf-8?B?WTFsb0NzVThYaGpmQzFscTkrYlk3VXBKdUs5dmdxZmVvaHByUmhZdldnM09u?=
 =?utf-8?B?bWk3NWdBRlZkNGFtTVcyRGhaWXpieUd0MHphdkxrT1pjN1k3VXJheUNadVZS?=
 =?utf-8?B?RXBub0xLcmFjZmxNQTBPM2tsOXlCZEg1NGo1VmxTSHFqSHF5RjU1SE96aGN6?=
 =?utf-8?B?ZlVrQndDRG10aTVXSWl0T2R2bHJjT2lHVmtXL0ZQbFN0U3c0V3JReU9lVjVx?=
 =?utf-8?B?alZZZ1huay9sbmRLOVBmREhtU1VpU0VBbHBNS3RhcUQraHBNR1YxN0RSQzVu?=
 =?utf-8?B?c2NQMUMzQUVUQUw5eE9yLzZCWXM5SVVNMHJEby8zSTEvYUV6YW83MFpVOGhW?=
 =?utf-8?B?SkUwUjFzVE9sQ1RJdDJseVR2Q09KVmFkUmx4bEpYekNLeHlxMHNLWm1nOFhE?=
 =?utf-8?B?ZFVBYVhoK2ZuZUVHbStaMWJsOFlCYjhHcGJZL1YvZUhCeWh1L3BRcXlqUTgy?=
 =?utf-8?B?YjFoSlUzMjNpYnhHdGZnQXQyeVpKQzZRUlNlK3AyNGYvRDRBQUg5VU56TGNa?=
 =?utf-8?B?SVR0d0YvQlFNWWJrSmo5cXdka2NEcjdMVGJKelM0SEN2SVUwWll1ejRJclZi?=
 =?utf-8?B?c2M5a2F6QmxNWWRUMEhrSzd0Zm1SaThVUzR2M2ZZNzdCbzBmaTNkNzRIMm1x?=
 =?utf-8?B?VDdaWUw2Y0xtOFpEOWFjWHhNay9WYS9sSDhwS2Q3QXJxOThmTjBqYUxmU2xm?=
 =?utf-8?B?c2VURE9pbnRxc1AzamRmYi9zSHVLbHNuZ3p3OHNDRStRRWZDblVqMVRCOGZM?=
 =?utf-8?B?bXQ5a1VvSmY2cDRQNzAydjlnMVR1dVVSVk54SUZnTS9LRFJ3TDFhTWRpUlIz?=
 =?utf-8?B?U1NEWDZFN3c1dlFBbnlUSzFaTkp6OVRNMC8zSjNNajN5VW5IUzV3WVhQVTFv?=
 =?utf-8?B?TDdDUjBmWWxYemtzOVBFbzNLUDFsbGYvS2dyVFp4RWFEYkprUnQ4YVFOZFBH?=
 =?utf-8?B?UWcycjJzcDA3NVN1M29VUC8yWEwxY3I3TGFEWXNSRWJ5YVIvV1o2Ym5CWDlU?=
 =?utf-8?B?UzhwWG5OQVRpK0VYeVBaQjM0ZkJaWHNLTkNLQ0R3R05SRVhwcWl6VUdWQUFP?=
 =?utf-8?B?QkVEQm9QUm4xMGRTa2liOGlBSDl1M3dBbHNDNm8rVm1wa2tib2JWbXp3WmNB?=
 =?utf-8?B?czkrK0x2cmUvSDQwTzg3QTZnakRrR1RjMU9WWXdGd3pMVTFRYmVPeVVsVlV3?=
 =?utf-8?B?aW1aamZGQkMxamVPNkV5QWtBVXl0QkVuaFZ2UzFhOTg0Ri8vVysrN3ZEdjFC?=
 =?utf-8?B?cmFmbEQxRjUzY0dJR2FveHpNU01JZmhlZWphRWtRWC9sUWp2U0JXSmNNck1p?=
 =?utf-8?Q?7a4JYRVAiiB8nJA6ab16RBhgTSufdiUexDfXcwy?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <368018DF870F2947B9458349613A653C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e728cd2e-ea5c-429b-87d9-08d98e59973f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 14:56:08.9337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJoCrCbbwg9T5Po98Ce/xrbKJ6nud0jB4QpTwZigUnOYFStHcBBKA9MLsAGHTrSdTyKVqwFPW7PYcmKiRwcmyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4798
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10136
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110130098
X-Proofpoint-GUID: hK1hqa59T1eeJX1f-aoix_SZvfId1pDj
X-Proofpoint-ORIG-GUID: hK1hqa59T1eeJX1f-aoix_SZvfId1pDj
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

DQoNCj4gT24gT2N0IDgsIDIwMjEsIGF0IDQ6NDkgQU0sIFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4gDQo+IEhpDQo+IA0KPiBBbSAwNC4xMC4yMSB1bSAx
NjoxMSBzY2hyaWViIENodWNrIExldmVyIElJSToNCj4+PiBPbiBPY3QgNCwgMjAyMSwgYXQgMTA6
MDcgQU0sIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+
PiANCj4+PiBIaQ0KPj4+IA0KPj4+IEFtIDA0LjEwLjIxIHVtIDE1OjM0IHNjaHJpZWIgQ2h1Y2sg
TGV2ZXIgSUlJOg0KPj4+Pj4gT24gT2N0IDQsIDIwMjEsIGF0IDM6MDcgQU0sIFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gKGNjOiBh
aW51eC53YW5nQGdtYWlsLmNvbSkNCj4+Pj4+IA0KPj4+Pj4gSGkNCj4+Pj4+IA0KPj4+Pj4gQW0g
MDMuMTAuMjEgdW0gMjA6MDkgc2NocmllYiBDaHVjayBMZXZlciBJSUk6DQo+Pj4+Pj4gSGktDQo+
Pj4+Pj4gQWZ0ZXIgdXBkYXRpbmcgb25lIG9mIG15IHRlc3Qgc3lzdGVtcyB0byB2NS4xNS1yYywg
SSBmb3VuZCB0aGF0IGl0DQo+Pj4+Pj4gYmVjb21lcyB1bnJlc3BvbnNpdmUgZHVyaW5nIHRoZSBs
YXRlciBwYXJ0IG9mIHRoZSBib290IHByb2Nlc3MuIEENCj4+Pj4+PiBwb3dlci1vbiByZXNldCBp
cyBuZWNlc3NhcnkgdG8gcmVjb3Zlci4NCj4+Pj4+PiBJIGJpc2VjdGVkIHRvIHRoaXMgY29tbWl0
Og0KPj4+Pj4+IDU3Mjk5NGJmMThmZiAoImRybS9hc3Q6IFplcm8gaXMgbWlzc2luZyBpbiBkZXRl
Y3QgZnVuY3Rpb24iKQ0KPj4+Pj4gDQo+Pj4+PiBZb3UgZG9uJ3QgaGF2ZSBhIG1vbml0b3IgY29u
bmVjdGVkLCBJIGd1ZXNzPw0KPj4+PiBDb3JyZWN0LCBteSBsYWIgc3lzdGVtcyB1c2UgSVBNSSBh
bmQgYSBicm93c2VyLWF0dGFjaGVkIGNvbnNvbGUuDQo+Pj4+PiBJbiB0aGF0IGNhc2UsIHdlIG5v
dyB0cmlnZ2VyIHRoZSBoZWxwZXJzIHRoYXQgcG9sbCBmb3IgY29ubmVjdGVkIG1vbml0b3JzLiBI
b3dldmVyLCB0aGUgb3ZlcmhlYWQgc2VlbXMgcmF0aGVyIGV4dHJlbWUuDQo+Pj4+PiANCj4+Pj4+
IEknbGwgaGF2ZSB0byB0cnkgdG8gcmVwcm9kdWNlIHRoaXMsIG9yIG90aGVyd2lzZSB3ZSBjYW4g
cmV2ZXJ0IHRoZSBjb21taXQuDQo+Pj4+IEl0J3Mgc3RyYW5nZSwgb25seSB0aGF0IHN5c3RlbSBp
biBteSBsYWIgc2VlbXMgdG8gaGF2ZSBhIHByb2JsZW0uDQo+Pj4+IFRoZSBvdGhlcnMgd29yayBm
aW5lLg0KPj4+PiBUaGFua3MgZm9yIGhhdmluZyBhIGxvb2shDQo+Pj4gDQo+Pj4gSXMgaXQgYSBI
VyBvciBGVyBwcm9ibGVtPyBNYXliZSBhIGRpZmZlcmVudCByZXZpc2lvbj8NCj4+IEl0J3MgcG9z
c2libGUuIEkgZG9uJ3Qga25vdyBob3cgdG8gZnVydGhlciBkaWFnbm9zZSB0aGUgaXNzdWUsDQo+
PiB0aG91Z2guIEFueSBndWlkYW5jZSBhcHByZWNpYXRlZCENCj4gDQo+IHY1LjE1LXJjMyB3b3Jr
cyB3ZWxsIG9uIG15IHRlc3QgbWFjaGluZS4NCj4gDQo+IEZvciBnZXR0aW5nIHRoZSBmaXJtd2Fy
ZSByZXZpc2lvbnMsIHJ1bg0KPiANCj4gIHN1ZG8gZG1pZGVjb2RlDQo+IA0KPiBvbiB0aGUgbWFj
aGluZS4gSXQgd2lsbCBwcmludCBhIGxvbmcgbGlzdCBvZiBkZXZpY2VzIHdpdGggcmVsYXRlZCBp
bmZvcm1hdGlvbi4gUnVubmluZw0KPiANCj4gIHN1ZG8gbHNwY2kgLXYNCj4gDQo+IHdpbGwgZ2l2
ZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgUENJIGRldmljZXMuIFRoZXJlJ3MgYW4gZW50cnkgZm9y
IHRoZSBWR0EgZGV2aWNlIHNvbWV3aGVyZS4gTWF5YmUgeW91IGNhbiBmaW5kIHNvbWUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBkaWZmZXJlbnQgc3lzdGVtcw0KPiANCj4gSWYgeW91IHRoaW5rIHRo
ZSBtYWNoaW5lIGdvdCBzdHVjaywgdHJ5IHRvIHBsdWctaW4gdGhlIFZHQSBjYWJsZSBkdXJpbmcg
dGhlIGJvb3QgYW5kIHNlZSBpZiBpdCBtYWtlcyB0aGUgbWFjaGluZSBjb21lIHVwLg0KDQpZZXMs
IHBsdWdnaW5nIGluIGEgcGh5c2ljYWwgbW9uaXRvciB1bnN0aWNrcyB0aGUgbWFjaGluZSBhbmQg
Ym9vdGluZw0KY29udGludWVzIG5vcm1hbGx5Lg0KDQpIb3dldmVyLCBhZnRlciB0aGF0LCBoYXZp
bmcgYSBtb25pdG9yIHByZXNlbnQgZG9lcyBub3Qgc2VlbSB0byBiZQ0KbmVjZXNzYXJ5LiBUaGUg
bWFjaGluZSBoYXMgYmVlbiByZWJvb3RlZCBzZXZlcmFsIHRpbWVzIHdpdGgNCnY1LjE1LXJjNSBh
bmQgbm8gbW9uaXRvciBhdHRhY2hlZCwgd2l0aG91dCBhbnkgZGVsYXlzLg0KDQpJJ2xsIG5vdGUg
dGhpcyBpcyBGZWRvcmEgMzIsIGluIGNhc2UgeW91IHN1c3BlY3QgdGhlcmUgaXMgYSB1c2VyDQpz
cGFjZSBpbnRlcmFjdGlvbiBpbnZvbHZlZC4gVGhlIHN5c3RlbSBpcyBnb2luZyB0byBiZSB1cGRh
dGVkIHZlcnkNCnNvb24gdG8gYSBtb3JlIHJlY2VudCByZWxlYXNlIG9mIEZlZG9yYS4NCg0KDQo+
IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4gDQo+Pj4gSSdtIGFza2luZyBiZWNhdXNlIHRoZSBw
cm9ibGVtYXRpYyBjb21taXQgZG9lcyB0aGUgY29ycmVjdCB0aGluZy4gSWYgdGhlcmUgaXMgbm8g
VkdBIGNhYmxlIGNvbm5lY3RlZCwgdGhlIGRyaXZlciBzaG91bGQgcG9sbCB1bnRpbCBpdCBkZXRl
Y3RzIG9uZS4gVGhlIG92ZXJoZWFkIHNob3VsZCBiZSBtaW5pbWFsLg0KPj4+IA0KPj4+IEJ1dCBJ
J2xsIHRyeSB0byByZXByb2R1Y2UgYW55d2F5Lg0KPj4+IA0KPj4+IEJlc3QgcmVnYXJkcw0KPj4+
IFRob21hcw0KPj4+IA0KPj4+Pj4gQmVzdCByZWdhcmRzDQo+Pj4+PiBUaG9tYXMNCj4+Pj4+IA0K
Pj4+Pj4+IENoZWNraW5nIG91dCB2NS4xNS1yYzMgYW5kIHJldmVydGluZyB0aGlzIGNvbW1pdCBl
bmFibGVzIHRoZSBzeXN0ZW0NCj4+Pj4+PiB0byBib290IGFnYWluLg0KPj4+Pj4+IDBiOjAwLjAg
VkdBIGNvbXBhdGlibGUgY29udHJvbGxlcjogQVNQRUVEIFRlY2hub2xvZ3ksIEluYy4gQVNQRUVE
IEdyYXBoaWNzIEZhbWlseSAocmV2IDMwKSAocHJvZy1pZiAwMCBbVkdBIGNvbnRyb2xsZXJdKQ0K
Pj4+Pj4+ICAgICAgICAgRGV2aWNlTmFtZTogIEFTUEVFRCBWaWRlbyBBU1QyNDAwDQo+Pj4+Pj4g
ICAgICAgICBTdWJzeXN0ZW06IFN1cGVyIE1pY3JvIENvbXB1dGVyIEluYyBYMTBTUkwtRg0KPj4+
Pj4+ICAgICAgICAgQ29udHJvbDogSS9PKyBNZW0rIEJ1c01hc3Rlci0gU3BlY0N5Y2xlLSBNZW1X
SU5WLSBWR0FTbm9vcC0gUGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFzdEIyQi0gRGlzSU5UeC0N
Cj4+Pj4+PiAgICAgICAgIFN0YXR1czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJCLSBQYXJFcnIt
IERFVlNFTD1tZWRpdW0gPlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydC0gPlNFUlItIDxQRVJSLSBJ
TlR4LQ0KPj4+Pj4+ICAgICAgICAgSW50ZXJydXB0OiBwaW4gQSByb3V0ZWQgdG8gSVJRIDE4DQo+
Pj4+Pj4gICAgICAgICBSZWdpb24gMDogTWVtb3J5IGF0IGZhMDAwMDAwICgzMi1iaXQsIG5vbi1w
cmVmZXRjaGFibGUpIFtzaXplPTE2TV0NCj4+Pj4+PiAgICAgICAgIFJlZ2lvbiAxOiBNZW1vcnkg
YXQgZmIwMDAwMDAgKDMyLWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9MTI4S10NCj4+Pj4+
PiAgICAgICAgIFJlZ2lvbiAyOiBJL08gcG9ydHMgYXQgYzAwMCBbc2l6ZT0xMjhdDQo+Pj4+Pj4g
ICAgICAgICBFeHBhbnNpb24gUk9NIGF0IDAwMGMwMDAwIFt2aXJ0dWFsXSBbZGlzYWJsZWRdIFtz
aXplPTEyOEtdDQo+Pj4+Pj4gICAgICAgICBDYXBhYmlsaXRpZXM6IFs0MF0gUG93ZXIgTWFuYWdl
bWVudCB2ZXJzaW9uIDMNCj4+Pj4+PiAgICAgICAgICAgICAgICAgRmxhZ3M6IFBNRUNsay0gRFNJ
LSBEMSsgRDIrIEF1eEN1cnJlbnQ9Mzc1bUEgUE1FKEQwKyxEMSssRDIrLEQzaG90KyxEM2NvbGQr
KQ0KPj4+Pj4+ICAgICAgICAgICAgICAgICBTdGF0dXM6IEQwIE5vU29mdFJzdC0gUE1FLUVuYWJs
ZS0gRFNlbD0wIERTY2FsZT0wIFBNRS0NCj4+Pj4+PiAgICAgICAgIENhcGFiaWxpdGllczogWzUw
XSBNU0k6IEVuYWJsZS0gQ291bnQ9MS80IE1hc2thYmxlLSA2NGJpdCsNCj4+Pj4+PiAgICAgICAg
ICAgICAgICAgQWRkcmVzczogMDAwMDAwMDAwMDAwMDAwMCAgRGF0YTogMDAwMA0KPj4+Pj4+ICAg
ICAgICAgS2VybmVsIGRyaXZlciBpbiB1c2U6IGFzdA0KPj4+Pj4+ICAgICAgICAgS2VybmVsIG1v
ZHVsZXM6IGFzdA0KPj4+Pj4+IC0tDQo+Pj4+Pj4gQ2h1Y2sgTGV2ZXINCj4+Pj4+IA0KPj4+Pj4g
LS0gDQo+Pj4+PiBUaG9tYXMgWmltbWVybWFubg0KPj4+Pj4gR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KPj4+Pj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+Pj4+PiBN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+Pj4+IChIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCj4+Pj4+IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZm
ZXINCj4+Pj4gLS0NCj4+Pj4gQ2h1Y2sgTGV2ZXINCj4+PiANCj4+PiAtLSANCj4+PiBUaG9tYXMg
WmltbWVybWFubg0KPj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4+PiBTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCj4+PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+Pj4gR2VzY2jD
pGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0KPj4gLS0NCj4+IENodWNrIExldmVyDQo+
IA0KPiAtLSANCj4gVGhvbWFzIFppbW1lcm1hbm4NCj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4gTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQo+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Cj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0KDQotLQ0KQ2h1Y2sgTGV2
ZXINCg0KDQoNCg==
