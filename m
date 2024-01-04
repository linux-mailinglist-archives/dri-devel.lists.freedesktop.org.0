Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B133C8240F9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0017710E468;
	Thu,  4 Jan 2024 11:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38C210E43D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:40:04 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4046ZkIr027241; Thu, 4 Jan 2024 11:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 qcppdkim1; bh=tfGhxdx+AZYIJUfOuVqxHR9stBGcMhFXQvHS3uI4Q+Y=; b=Da
 nfZrdyL/hGdG/mdPq8Hk+jFi4BDjzfd5Z86ovGxbmwzYTdjgabyHTCO2wvGFHdxT
 8hE0jPPMa/C5owSDFxwByHHGBQC6YfkNgHfbB6iXwZjKYrRQXm06MoQIKdgTCLqw
 P98zaG/1eOBXusbo4V+2Jo2ubvUAmxxsXwky11SbER2fuXCTp73qEH5pU4LSiQF3
 xefA+it0xRJEl2nbYECU55hbe7Qo4xWTHbG1lmIFiLs5C0xe+JKgy+0I16A2/LJD
 bV3IKNvhqI9bXlWNHXUc26unStTDatUK6rz9zZWIsoqMp0Pj7+35IB2i1JUv3UOs
 gPrbbfTuXJ5sSZ3Z+Hjg==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vd8s1jp7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jan 2024 11:39:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxzrlPDBrKbOWXJed3hBL2ZKdInIgrXAkHRFLOMnZbu+W05Hck6+edUo4ZIkL7iTYe02F970Jns65iXpHQeJpuZnLKuU+JU5GX+4FohYJAF5YG9IY3rZnosRe3Fc8gznQU9cTQTDvat1Wr8erzGK+1IIXJ+AlZ1d8nSyoF68eK7N5pxGzIIy2slWI61nQ0DjFxWO/ue4v0vlVDUDtxk+d+v5FgKD3aWbTag0dXayX0p87KC7lRNgikMJ8nX7oc1gctWnS6CSNecI3xDbLerufjLDn+CahC8rwu6jI1WCCtwPu2xKHuSXVFHpB4B4s8St/P54t8TKIkCepAozfDWq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfGhxdx+AZYIJUfOuVqxHR9stBGcMhFXQvHS3uI4Q+Y=;
 b=QmFY8N3254W3CKTm5V5mz4qf2vfjob/L1zoxUoVWOPe5y1CJkywXXINxQ48SgPXhMx1y5wYNbvFXnM08F1qxYNcs/wk7CmZnmhn907bmyxWxD3cFPc/eqRH7tC9WR38vsxA3OHggAuXCRyYui9J58JGP66nmHsHYUpPVeJfkZ5Vp8fRZd+pTQvI8RVcGwpSoBV+VDAfkp6lKM5zUXoZlG0yhmDfGokf1tcyvyTKa1vxnMMAnkmYFWdqgIrev5qrsmSXPsTlKdl25CERiO8qwhzv7CdrPey33mVLAZeMZliKsssiJuUrrZAATk9lrIn/Oof7tTR8MO1xRh7fpxtgOQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL3PR02MB8234.namprd02.prod.outlook.com (2603:10b6:208:341::13)
 by SA2PR02MB7771.namprd02.prod.outlook.com (2603:10b6:806:143::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 11:39:27 +0000
Received: from BL3PR02MB8234.namprd02.prod.outlook.com
 ([fe80::6b86:dd1b:d3ae:d013]) by BL3PR02MB8234.namprd02.prod.outlook.com
 ([fe80::6b86:dd1b:d3ae:d013%5]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 11:39:26 +0000
From: Ritesh Kumar <riteshk@qti.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Ritesh Kumar
 (QUIC)" <quic_riteshk@quicinc.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [v1 0/2] Add support for Truly NT36672E LCD DSI panel
Thread-Topic: [v1 0/2] Add support for Truly NT36672E LCD DSI panel
Thread-Index: AQHaNMcPWiQjaTqUZUqKDGWiC6YkIrC1b0EAgBQrxWA=
Date: Thu, 4 Jan 2024 11:39:26 +0000
Message-ID: <BL3PR02MB8234A267ED4DA78F54D0CF6188672@BL3PR02MB8234.namprd02.prod.outlook.com>
References: <20231222110710.19397-1-quic_riteshk@quicinc.com>
 <b2472f53-2e60-46ba-9ae7-aeca1b323f37@linaro.org>
In-Reply-To: <b2472f53-2e60-46ba-9ae7-aeca1b323f37@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB8234:EE_|SA2PR02MB7771:EE_
x-ms-office365-filtering-correlation-id: bdf4b5f0-da7a-4ece-8738-08dc0d19ce50
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ewLEnUKsMwLHE8J6cs4qoIijIJXjMFhs/MqLfgtnUeHy0z0fPtHGCVHaEsCM5Y8G7N76w7HG26xCE2Zv1Qy+GH1QsCJfoD3NYZsswP5aeKyASLzS0vlNbrcfZaG6gYnjGQNMXn+iPBfzZ6+d4Kf1Xom32btXpS/45sf9Czy8R7MBBpJZsA9p+50/sejsC56tWtdzFZiWyX0Mhynh1LcoHfp7TORmJ2a2Kjp0keTqYs7iGGC6FnWhKzokgSppfEYExc10YIpxaHLONaL6MdcRTpGMYO1wBPo617d42mqB7i6ltEhM4bVOSLWlSso0URBiqRR3afT1mcEV1tv++dIk2fc8dr2wcvb8PHGhi7Gjq354JXMxyyqA2cGuqpjcPpUX/anB4YU6/Zxey9d5Qbwopq2b1ZK/zf8y4+LH9Ssi0mSCAnsYnxU3CIkuPB6s4ANO9ajYEA6roKQ0FCFbPBBipjjJn76dwQz5SCaybarQxVMmUjTvfGWzk7No66PDTnpqYFHSGKOl0JQyqUV+yvmeochfRcfwmkuVLnfTH7PEqBEk5RvbYXix5P0wdhR32wkVxJK36kTFAYqDnMCz7jKWqJ5gQ0QcbJ6/u55wKfNLZvmVAAh3ysp1mzI7Q5uaxaZZ6tgSHZzKC97hy7sBvr9tewmnBVInjfIjDNFWqjRK9Ic=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB8234.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(396003)(136003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(451199024)(1800799012)(5660300002)(38070700009)(7416002)(2906002)(55016003)(52536014)(7696005)(122000001)(6506007)(9686003)(4326008)(8676002)(66556008)(66476007)(66946007)(76116006)(8936002)(478600001)(38100700002)(83380400001)(71200400001)(86362001)(54906003)(64756008)(33656002)(110136005)(66446008)(41300700001)(26005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmVDWXp3YytBcmY3ejFlb3g5ZUNMWit0bk5NZFVtbnh6VWtkcmx6SnJGdGdh?=
 =?utf-8?B?RjlZZk5ORU8xWjhrbHRrUVVwWlRES00xbU0rY0FZY2NJMSs0dVhJamhPc0Y1?=
 =?utf-8?B?dkpZTHc5TEppUVVRd2tKa3dFMzBSRk0zV3A5by9FaWFCbHh3OUkwRGlmeUFz?=
 =?utf-8?B?V0syWnJkbnJzbVMySDRocnhNSllCMjdqN3d6K1JtTHcyZDRkSm9iV2FsMG9p?=
 =?utf-8?B?a21uUG9waWswa01PVXV3SjZWMy9TTDVmc3lzS2JmS3dkaVJBSVV1Q1doS1FZ?=
 =?utf-8?B?UU9aV3M4YThHazVrRHdYTUJKNTU1djAxa3d6QzNyMFg2TG5ScU1PN3BHamNO?=
 =?utf-8?B?OXZraUNxM1VDcTZlQmNSZ0pWZkJRSnRJRWhjRVpnU001NThDcVdnRXRVekpa?=
 =?utf-8?B?d3lwMTBmVm1BVEszcUgrWFgrR01MYUJNbzB4dmxwZEYxRnJiR0FuZnMzcUwv?=
 =?utf-8?B?TWV6RitnZm1hSFgwUlZDc3cvR3JsWEFtZWZhSC9VWUw3b2hhb3dWdEpxVTc4?=
 =?utf-8?B?UndsNTRXMVRPTUZZZFFDZkhKeWxta2Q0c3dJckhBaU9PRzZBQmlTV3JuU3h4?=
 =?utf-8?B?RjJPWWhhck9SY0Y3UjZsUGdXVDZLMjJFaDBZTlBxQVBaelhGMFR1clM0MlND?=
 =?utf-8?B?TVNyeFBOZ2hWcnBCL2tBZDZiMVpCOS9OK1l4VlpzbDdUQ2g1TFNUclA1TlRw?=
 =?utf-8?B?dGJJR0Rmc2ZFV3FnNTJtR2U0SzdLQ2dvZHJJVGsyM0tIcUlRYVdBL2hXZ3Vr?=
 =?utf-8?B?NWJXOThnZTVycG4ybDh5azVqcUgrQVIwekkzTDlWVS9Oazk2MUp4U20zcS9s?=
 =?utf-8?B?bFFjVzRNOTYrbFNvOWVaSkZwb0ZMMmo2c0VxNkdHeGVoc2x5WHZWdHZXUjJv?=
 =?utf-8?B?TzhoRWNWQzZFZGFZYU5nakNMM0lReHNwazlxTTJpZ3pIME9NaklYQm5uM1d3?=
 =?utf-8?B?aFZqRHhrb29iRlM5YlRhWWUxV3MzeUU2Z2VVdnpvSUt4LzRxaWNDMjM1UUlx?=
 =?utf-8?B?YzltZEVUa0FXblhxdjBYYVloeTB1OUJhU1ZGbWhsQzFaOW1QMFpseG5GUS9O?=
 =?utf-8?B?bjdaTjBiQW5jTXowalZkQTgvQlByRVhleTFWQi9HRk1FMkhQZTNNV1grSXRQ?=
 =?utf-8?B?SC9tQkZmRUJGZHhCQ2VDc054eWxLeHNZaVRGN2UyRmZtTHBnTzloUWNROEhN?=
 =?utf-8?B?bGg0N2diQ2E2TkVZSjNhaFJTQWV4Mk82Y3pnWXZPR0JUeUZhV2luaEU3cHE5?=
 =?utf-8?B?UTlZUU5lbE5OYlBWTUhVbk5rQUdYQVVzb2Z5dnFuL0cxa0FLQWoyK1FWVHA3?=
 =?utf-8?B?NUx5MFhnYnA4d1BtczdDcUdlb3pvdHJUekF0ZzJ3TzRtL2tFSG53SnlUaGY2?=
 =?utf-8?B?WXM2MDU3TzMxRmdieVZjZk5vOFZueDFRRkFBZ0NWaDRBY0VPbzdMOEpDL2tn?=
 =?utf-8?B?Z2JqNzZLL3V4bm1VS2tUeDl1MGowOUIwa0MwcVZFdjJEdXVlN2w1UHFtMlc1?=
 =?utf-8?B?Q2ZMU24zNElhek9RRlk3dGpZclZoZTVoZjJsemlrM0U5aWF5N1pzWllMT2M0?=
 =?utf-8?B?MVVUalVlVE5zT21mT0Rta3Vad2RIK2E3TUhRRzEwQk51V3FGRVFBU0cxUjdC?=
 =?utf-8?B?c2ppaGt3RUNMS2VnZ0ZxNHQrRmpuSUpFOUJLWHBmeGpJMWE5d2dwNitzTXZX?=
 =?utf-8?B?ZU1CNEZqaWdhUW9sSHFHbXZzcjlJdHJXNHBYengxVkY5Y3RjTHZ1aW92UUdu?=
 =?utf-8?B?ODd4ZDg1RlM1NXNFYkV2bW1uMXRoVW5JZFNISW0vMmZPOFJkbVk2ZkhXL0VV?=
 =?utf-8?B?bHBzNHZ6NTlubnlqekJiQmh3TlZmQjFZaU1DOE9xYTJCSUdNZkw2SVZzYnJl?=
 =?utf-8?B?NGl4am9jWWdWMU9JQmRZT2JMUkk4L3dwa1ZWaGhvVGxUU1Y2ZU5WMTNIdnlk?=
 =?utf-8?B?Y0RwTEVNMmVRMmpid1RKSFFkZ1JPZzlhTkxyR0J4cHZZcW13MXdjREtFUGc5?=
 =?utf-8?B?NkhzRXFzUVBkYVFOV29NeXdCdlZlaFNDYjQ3ZHZUdzc3aHp6NndrVW0xVWZs?=
 =?utf-8?B?eHc4RFU5Zit0WFYrZTZFeEk0M1VCWHhSZ1kwK2ZjS0pJQk5pakpsR3pnZVQr?=
 =?utf-8?Q?J5RcdPgbzNvT1N1jn4iClwwRP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: qHnjkieerf/r7dS8QPYYWeFcUJybPa/jBovgdsRzZ/vZUb/+Bz8S+PRfAlkzhW/KLN05WWJetMXD6M/AuWS1IXj/PzIdqQ91KbGm3qTbBnmDggw8EgIvirgJ42ZF8Cia3Zxvtni6MY+K0uNo1WTXHh2XDuit5aehY2YNbehb2Ny0guHe8KYCyD9r5OZVxL4ADyobiBjYdx7BUoZTEGDi92biJky1NCYhGhyp74GpdcJbHrQtKEnHejbnEuLFv00emqa9V0RTw3cUtsiTU55Iys2Kdcdy8qk2QJ0VLPVnQD5go9jUwanJIAlkpIBln/Nc+rHJdjaYmt6JXF7lEC40ca6rKf4qWWyxDLmtaS0B1Bf7jxxuQ7ojztiRtmMulWLz+jm/pFFC8bZBapYYB5ISVoOHskI+stZfpD7oNqXObNowLZhLFwaf2DtMCZCjgZ/ich5co7vCOYaOQEpxdcLa+C721IwsaKuoQPO9QP9bNJChJ6+7DD41GPP11HrArLpeX+gcxg8t1xqi8QJkc3ReWf3sWKhVKI1+rhNB4jhaMIgXVP0LnglVakIDSpZrdGjX9sX9M9b5WXRzw0/BmuJQuQCpY3JMnEIEsN9jXRewQWME/aVb6SDMJUTL+Wt++uCX
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB8234.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf4b5f0-da7a-4ece-8738-08dc0d19ce50
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 11:39:26.6288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v36lcQCO8/SyoRMg9vLy78It08MZp+fHaAJH2vAk3UqHvWAqISYjyPcnVEu4vdY1yERZiNn/FRAI5yNI/+pAFYZhwru/XZITIoCrjQi1LZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7771
X-Proofpoint-GUID: v-OjL_FtJ6heJ18_2mRJKttwAToAsFLP
X-Proofpoint-ORIG-GUID: v-OjL_FtJ6heJ18_2mRJKttwAToAsFLP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401040089
X-Mailman-Approved-At: Thu, 04 Jan 2024 11:50:06 +0000
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "Rajeev Nandan \(QUIC\)" <quic_rajeevny@quicinc.com>, "Jessica Zhang
 \(QUIC\)" <quic_jesszhan@quicinc.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+U2VudDog
RnJpZGF5LCBEZWNlbWJlciAyMiwgMjAyMyA5OjA1IFBNDQo+VG86IFJpdGVzaCBLdW1hciAoUVVJ
QykgPHF1aWNfcml0ZXNoa0BxdWljaW5jLmNvbT47IGRyaS0NCj5kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj5rZXJuZWxAdmdl
ci5rZXJuZWwub3JnDQo+Q2M6IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc7IEplc3NpY2EgWmhh
bmcgKFFVSUMpDQo+PHF1aWNfamVzc3poYW5AcXVpY2luYy5jb20+OyBzYW1AcmF2bmJvcmcub3Jn
Ow0KPm1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbTsgbXJpcGFyZEBrZXJuZWwub3Jn
Ow0KPnR6aW1tZXJtYW5uQHN1c2UuZGU7IGFpcmxpZWRAZ21haWwuY29tOyBkYW5pZWxAZmZ3bGwu
Y2g7DQo+cm9iaCtkdEBrZXJuZWwub3JnOyBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5v
cmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7DQo+QWJoaW5hdiBLdW1hciAoUVVJQykgPHF1aWNfYWJo
aW5hdmtAcXVpY2luYy5jb20+OyBSYWplZXYgTmFuZGFuIChRVUlDKQ0KPjxxdWljX3JhamVldm55
QHF1aWNpbmMuY29tPjsgVmlzaG51dmFyZGhhbiBQcm9kZHV0dXJpIChRVUlDKQ0KPjxxdWljX3Zw
cm9kZHV0QHF1aWNpbmMuY29tPg0KPlN1YmplY3Q6IFJlOiBbdjEgMC8yXSBBZGQgc3VwcG9ydCBm
b3IgVHJ1bHkgTlQzNjY3MkUgTENEIERTSSBwYW5lbA0KPg0KPldBUk5JTkc6IFRoaXMgZW1haWwg
b3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5IG9mDQo+
YW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+DQo+
T24gMjIvMTIvMjAyMyAxMjowNywgUml0ZXNoIEt1bWFyIHdyb3RlOg0KPj4gQWRkIHN1cHBvcnQg
Zm9yIHRoZSAxMDgweDI0MDggVHJ1bHkgTlQzNjY3MkUgTENEIERTSSBtb2RlIHBhbmVsDQo+DQo+
R29vZ2xlIGRvZXMgbm90IGZpbmQgYW55dGhpbmcgZm9yICJUcnVseSBOVDM2NjcyRSIsIHNvIEkg
aGF2ZSBzb21lIGRvdWJ0cw0KPndoZXRoZXIgeW91IHVzZWQgY29ycmVjdCB2ZW5kb3IgbmFtZSBv
ciBwcm9kdWN0IElELg0KDQpOb3ZhdGVrIGlzIHRoZSBERElDIHZlbmRvciBhbmQgVHJ1bHkgaXMg
dGhlIGdsYXNzIHZlbmRvci4gSXQgc2hvdWxkIGJlICJOb3ZhdGVrIE5UMzY2NzJFIi4gSSB3YXMg
Y29uZnVzZWQgZWFybGllciBiZXR3ZWVuIFRydWx5IGFuZCBOb3ZhdGVrLg0KV2UgZG9uJ3QgaGF2
ZSBvbmxpbmUgbGluayBmb3IgdGhlIGRhdGFzaGVldC4gV2UgcmVjZWl2ZWQgaXQgZnJvbSBwYW5l
bCB2ZW5kb3IuIFRoaXMgcGFuZWwgaXMgYmVpbmcgdXNlZCBvbiBRdWFsY29tbSdzIG11bHRpcGxl
IGludGVybmFsIHBsYXRmb3Jtcy4NCkkgd2lsbCByZW5hbWUgVHJ1bHkgdG8gTm92YXRlayBpbiBu
ZXh0IHZlcnNpb24uDQoNClRoYW5rcywNClJpdGVzaA0K
