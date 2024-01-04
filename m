Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE20D8240F8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C63810E465;
	Thu,  4 Jan 2024 11:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA74210E3F3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:46:31 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4049npUW013926; Thu, 4 Jan 2024 11:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 qcppdkim1; bh=WLrOWqXzNqN6ikzCRAB0Gk+P7i9mokViJKAeeVbb3PY=; b=dQ
 6e/+O2SSxhIlqkHTMI7IOOYDWuB0zJI6hsuEEPJClvXsUEBkddas1KZO9uE3mvTl
 XL4DAt4TwDfdyyqhUROPlBSJtukYc0JYdY3PwTUV9/cPO4wyeCr19MqQLujnXwOl
 K0hhqHklcegSMdgr2PYMcsQ0saLz3Gz1Qpt9lPmgTxW+p/HMgEXtGtGEZreZoOna
 OVBcyT7V7x2URI5iDn9Qdq5H8ccxeV1duMf8+v5qpr1pvF2+2wkiE2mKMsPfcPxt
 38tQELGkbM8Zikkeu+jpJOFFrnfF0mFahukaDWQh7kbbUQbGA0SS5TgtnCYSjJMU
 6BY1pKFw7W1oLSFzPf6A==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vdtcw08t4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jan 2024 11:45:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsb2LnOY7eGIBcYMB8NssQZsYvXQhcqisfzCacqtX7TlIMu45qa729N4c9lL4lN4n8Jt+uYErtgQo60Rf0DT7jOEeVDDD8MrIV7aNrt8H2VWZ9f78C1ddhDPqDqxlFS2SO5AEgHOufwVIYNerGQHOAg5V2aHrSeLn8TnBf25FciIvO1PJZY0J3MAP0fGgMLtSLYLErOnRXVWDXaqBpawKPUS/zAyz3FXu6xcS++5to4y5sOz1i1cd9euLTk/zWBdl2VGZjQyrKzQRtZaRHDRBwr77jaJhYVE8GWclOigS1F7wpEF1UMpyC/+qeung8jPEY+PHH+dI53h3rPSvEy4gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLrOWqXzNqN6ikzCRAB0Gk+P7i9mokViJKAeeVbb3PY=;
 b=ZeDaixR6KuBVLapyAJQ1J0KvHDovebbIExfU7vfHnXXUX5yxiQIqbAG39ZdM2HJXZv0JF2/FY8le4kS6XHtWa/viCbQF5oEUY1mb7oZOuAZz+sjeLvr7ia0oIUByDiaDHNB8/HmKK8/xqee2RViTE+BfcD2fsmxXftgULY5puxjcGtt1JxA0rZqzbmYgB2A37aM4QqphQK2vgCrdnm6/BVU8fffTldxulZghNLRY2CWqjuQglkVQybiQbm4+KchEUedvE79tsAjIYPdijgDaAG6Skj4aqL98rn0jnsFMbbCP98r7ogfn4YpMv1ltKwlSslnCQUDiaH2ItCBpa6bXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL3PR02MB8234.namprd02.prod.outlook.com (2603:10b6:208:341::13)
 by SA2PR02MB7771.namprd02.prod.outlook.com (2603:10b6:806:143::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 11:45:31 +0000
Received: from BL3PR02MB8234.namprd02.prod.outlook.com
 ([fe80::6b86:dd1b:d3ae:d013]) by BL3PR02MB8234.namprd02.prod.outlook.com
 ([fe80::6b86:dd1b:d3ae:d013%5]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 11:45:31 +0000
From: Ritesh Kumar <riteshk@qti.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Ritesh Kumar
 (QUIC)" <quic_riteshk@quicinc.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [v1 2/2] drm/panel: Add support for Truly NT36672E panel driver
Thread-Topic: [v1 2/2] drm/panel: Add support for Truly NT36672E panel driver
Thread-Index: AQHaNMcTZ+6asId+jkuhqdiedTMDALC1bxYAgBQtTgCAAADMUA==
Date: Thu, 4 Jan 2024 11:45:31 +0000
Message-ID: <BL3PR02MB8234947987A426A5516E715588672@BL3PR02MB8234.namprd02.prod.outlook.com>
References: <20231222110710.19397-1-quic_riteshk@quicinc.com>
 <20231222110710.19397-3-quic_riteshk@quicinc.com>
 <46526faf-5789-442d-9fb1-ca80a8cadde9@linaro.org>
 <BL3PR02MB82345A9E94DC7C6642BFEBB488672@BL3PR02MB8234.namprd02.prod.outlook.com>
In-Reply-To: <BL3PR02MB82345A9E94DC7C6642BFEBB488672@BL3PR02MB8234.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB8234:EE_|SA2PR02MB7771:EE_
x-ms-office365-filtering-correlation-id: 9cebd1da-fee0-42d0-d402-08dc0d1aa7da
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w9mYFoWmr94jhEtlspvqqG0Iq5iOrGSbGTQ5mo5qOscmH61TwQibp6iYlFDDncS2qXpUMLrCKbkqBsOQJ56EWbsD2Z++v31H2gRdYAt0xQkHJOq7CBUMXshi0SaqQU9eM7X4H6EsG+1uGep4EC+FdJmV48ttEZ/8maYAWdjk0bVq+icDAaX7aVjj//Hu/muskKwfs06Ihenz0LhBFShAxUWpEbru9E/TlsjqRAn0WJ7Zdvc/3x7tgu4+FMIkTho1hGnfGsSuBoIMSNh+OeMK2WexwMZR2aUEk/91r4SH+PAt1IHEBL82+YP+MvkQ+idp5cOGWUHPC34iCEDJCBWTUNG3pjuENn84yQmzwf8OaPT6AUylg78Mj+ZMeAETKMgbNF7BfKEVVdYqk0PqOfYfOf/BhiF7S023EFt5jcJTIr0FRWx6bCIRWscrYmtpwOwlJYar5zshGFQywxbMAFVDGMSFI4wiygTz1zXEPZjL12Du3MTkNFaWcrHf8XhumbEgqZYY9gvJGBYx+VqWkb8G+4TIpugbJ3p1mX5fGIJIYWDSavBvnrH4R0hF23jkzjNp0R0QElExUPSoKdqajAAZ6IyTE6JvmsDWxbBwRV6Y/pcLDm7fEm7m8V4K1GowdBq+wduzyLQFBs+AefuoPHLyLU5mI7Fov/Z1IzH5yrbHWGg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB8234.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(396003)(136003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(451199024)(1800799012)(5660300002)(38070700009)(7416002)(2906002)(55016003)(52536014)(7696005)(2940100002)(122000001)(6506007)(9686003)(4326008)(8676002)(66556008)(66476007)(66946007)(76116006)(8936002)(478600001)(38100700002)(83380400001)(71200400001)(86362001)(54906003)(64756008)(33656002)(110136005)(66446008)(41300700001)(26005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXg3V1lMQWpiRCtnWmNwdjZKSUIwanRkU2NQUlRhWndSWHhXM2p0U3hoSHpv?=
 =?utf-8?B?SHN3UUs2RUlsdGdKZlh1Wm9WZy82YkJwU3lxeSthRDFPcTJXSjB0QUFtOEpL?=
 =?utf-8?B?RmxKbEZVdVRWYkluQmNueVFPYUhVZXhmSWFLZmtWWHA3bjZ5ZFd0U2pxbE4z?=
 =?utf-8?B?R1UrT3hmcFRpRk5FTkxKZWhuVEw0clpyZ0ZsdnUvU2ozalhJTUhaWTQ2RFAx?=
 =?utf-8?B?V2lhQ0o0T3haWmlkOXBNRTNCQUY2VThyR0kyTzhqVHFVaEhId2JnbEhpcXhZ?=
 =?utf-8?B?S3oveEZvYStPYVEyNjR0TXZ1R1NXZUZJN0N4aDdWS1BLTyt6R1h0MHM4eHc5?=
 =?utf-8?B?dkkvTUYxRkVOM3dGL0psd1hoODN3OHROa2pjdHRKYXBic1FxdFVZMHg4Q3E2?=
 =?utf-8?B?YlBGNEM2TkZKZTBzdWRaY0xOY3RnZ2VMZnZjMnVEQWNPWW55MkJsdWRwK2k5?=
 =?utf-8?B?M2toZUtTVS9VU1dlY1JFUWZEam9sbk9jeEJER0tLQjBYOXZHN0JwcFRFYUkw?=
 =?utf-8?B?a3FXajJ6ZjdwOHNLMmcvSUpqMytvbGVKS0xzYmNkK3RJUDBGTld3YnVLcVp5?=
 =?utf-8?B?VUs4R1RHWE1KbjJaZUUxcGdrMXpMcVlaTUtucGIwYXNSRjJ4TU04VkJxc1BX?=
 =?utf-8?B?Y2FVMUdvVkM4UVF4VU5ndTJSZ3I1RjBKdlJVekdLTHkwYjAzamV3ZzVHVitK?=
 =?utf-8?B?YnRIM1g4Nm1IRWR6QUJZMlBlWVYwTU96Nkp0aXJINHVadXN6L2VDRzJzVE14?=
 =?utf-8?B?ckg4T01VS3JBSXRQR1RIalYrR1lHOXl0ejhaU1QvRjR3QnFvQ3dITDNFdEF0?=
 =?utf-8?B?ZkJCeG81QTRQYWRqMEdqUFlhanhBS040Q2hFNTI1K1Nlb0FmdStoUWNzWFB5?=
 =?utf-8?B?cEorOWJaWWtReHVCT0NEcG9RbVVWUmZYTUJmVTlucnpxNGhkOEk3T2tUV2hE?=
 =?utf-8?B?eUNjNGV1ZURJdzRHTmpVSW1RK0sreTU1QXo4NUJzSC9YNzJDamgxaC9ONlFh?=
 =?utf-8?B?YVRSL2x4ZkZtQmpHbGdOeURRU1NLUTFrWTJYS0tMK2ZNY051Z0tCbGhyd0xo?=
 =?utf-8?B?YktWbzlKNHpnTlRLa1B2YVBwQlN2UTBQVjdqcllCb0FPWFg1NXZvc092VWdO?=
 =?utf-8?B?V1hXdDJJOHo4ZHVQS1J4R24vcER5NG95OHlxZEJEckpJVkFJVnliTXVhOWtC?=
 =?utf-8?B?aUJ3S0NCMkt4NXVFa2lJbGNGSk9ERjZqNXVWQ2xhQmRnQUNhWFRZYUVuU2NE?=
 =?utf-8?B?QmR6Z2VWQWtROE55MGNPSXFvbE5Pc1dKOEFWTnc1TWF5Yi9jUXZvWEJONFVX?=
 =?utf-8?B?S1FhMmJMbW1uV2V4ZGxwSTE0OVZDVW0xbEo0QmdvUDYyNUZvZGNBaDJ5ZFc5?=
 =?utf-8?B?THdBeWxZZkE3YWtqYUljdXBWdmpmZXp6TzIrd3RMN0htRVg4cG9aR0RCVEN4?=
 =?utf-8?B?WlhmK1RpSGNaVzBweUJSajB0QjVrS3ZkdnBOTE9haCtwYnVtQnRZeVpLZHFW?=
 =?utf-8?B?NUdLM2lGY0RoTFh2bE1VMHpiV1FTWFp2dVZROU5LR2JtWFJwNm1xOXU3ZWZX?=
 =?utf-8?B?Zkc5M2MzdXJoQkVsbm9jUVJRaTlnRUxGVnlQVllQRHJTRkxiZU1jVmJhY1Iv?=
 =?utf-8?B?dVJBZHFaaE9lQ1VMVGJ5T2QyU09PczhFTjAydmQxcHIzUG5EdXkwdDVweDUz?=
 =?utf-8?B?U2dpS04wSzZZc2NoRk9ic3NJWnEyWmlQQ1g2d3RqclBIcldXeW42d1lEcmMx?=
 =?utf-8?B?aFpHemUrWnBXZzdMMFJ4MHpES3FOWHFqdmxEYXd5R1ZXOXd0MWxXOUVqOGIy?=
 =?utf-8?B?cDZwOHBSNzNtVmtHK1pGZW1PWUNYM0hRRE5zV0hjZEcxNzQ3YkJ6UTErbjhp?=
 =?utf-8?B?WFkrbUhvSXE1QTR6OW4zVmhEYStWdEdML1BGT3pVU29xWk9sMFo0bGdDRlpZ?=
 =?utf-8?B?WjhLbG1HRUMzeGIwMlJDS3RoRzRQTzJZUGZ6clNySnVWVDJ0WmI5NmFLQ0VT?=
 =?utf-8?B?V3o3bDRSTXF0YnA1d2VVb0R5YUw3WlVrMmhCMVBHekhCWWtiOHM0Y3liV3Mz?=
 =?utf-8?B?SWIxVkVNUXA0eDNVNVQvSkFSVXpzNGo2M3cyQWJnM1BDSDVIZTY2U3RPMWdD?=
 =?utf-8?Q?lz9J4qgQOEKKLGXf3v6pFcx5V?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: F9cJDCi7tAUV5kHE/p8jCSzgT/OwJbbpZofR98SGUZonheucorQK7bOxe/mHh++76rAGq40zfy4h/TsMR0slGrmQMfbx+bMlz2Y/VWhOqrYTD4kKzC6iZR9Kx3KcV21U4SYwrmGINOPtUjHOERg9hZntneuzhGDaEzL20mD6sm0n/h2wyzwJydbDODLmckSOOeohyt6EKVNiDV/wnfSDDYg8GyuPUFYZ3DU0xaFeMmghZsII9fwe3P3r5fVfyLrhIOlnVGAB1Hnre7zE60BFMlwZu/5qGO1sU562ZbcgDjtXEOtG7wxYVDsoaY7wmTuTRuesuC8T6AKHwLt0njAeYMtYKlZj7ubuOcHr/Ei/bMYrp1r158TGYtPSM5f4Z+xdfiT9Z4NKzdOEe2dsAM8xnA/WNo4TtDzuD7I7vcta/RSOY8JMKmgmV5cgRAgkJi2iCf8Sd9UhbmXHChEk296pD/8kLMhx1WU1J5HOpN9p39Dt478o80YYZhXEukbkvbwgWtWsVombQ/6n5KyLaBQXmrZs94IsxKP1lEIvzke1uUtXoTkLh+62Zvw7bCo36mcZKGRBJCLUOk1y2NbN/S4X/uNpuB/d7+8ZuWdzFxnLJpwU3AsrCPkKtNEcysIKCYKY
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB8234.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cebd1da-fee0-42d0-d402-08dc0d1aa7da
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 11:45:31.5844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HfrdhWgOA/SV7JaP9xt69eUU7tgElZtB1UbYiwxMAee4XPDvCC/rzG4PSoNk9C1g3xUbmoZ1I81zS/lDUEl30nmy75dLgey2cfo/QGUawI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7771
X-Proofpoint-ORIG-GUID: HT9bzAoOZSgG9aeBqfUm51EdTWydFjgG
X-Proofpoint-GUID: HT9bzAoOZSgG9aeBqfUm51EdTWydFjgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

QWRkZWQgU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4gKG1haW50YWluZXI6
RFJNIERSSVZFUiBGT1IgTk9WQVRFSyBOVDM2NjcyQSBQQU5FTFMpDQoNCj4tLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPkZyb206IFJpdGVzaCBLdW1hciA8cml0ZXNoa0BxdGkucXVhbGNvbW0u
Y29tPg0KPlNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDQsIDIwMjQgNToxMyBQTQ0KPlRvOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+OyBSaXRlc2gg
S3VtYXIgKFFVSUMpDQo+PHF1aWNfcml0ZXNoa0BxdWljaW5jLmNvbT47IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7DQo+ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj5DYzogbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZzsgSmVz
c2ljYSBaaGFuZyAoUVVJQykNCj48cXVpY19qZXNzemhhbkBxdWljaW5jLmNvbT47IHNhbUByYXZu
Ym9yZy5vcmc7DQo+bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tOyBtcmlwYXJkQGtl
cm5lbC5vcmc7DQo+dHppbW1lcm1hbm5Ac3VzZS5kZTsgYWlybGllZEBnbWFpbC5jb207IGRhbmll
bEBmZndsbC5jaDsNCj5yb2JoK2R0QGtlcm5lbC5vcmc7IGtyenlzenRvZi5rb3psb3dza2krZHRA
bGluYXJvLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsNCj5BYmhpbmF2IEt1bWFyIChRVUlDKSA8
cXVpY19hYmhpbmF2a0BxdWljaW5jLmNvbT47IFJhamVldiBOYW5kYW4gKFFVSUMpDQo+PHF1aWNf
cmFqZWV2bnlAcXVpY2luYy5jb20+OyBWaXNobnV2YXJkaGFuIFByb2RkdXR1cmkgKFFVSUMpDQo+
PHF1aWNfdnByb2RkdXRAcXVpY2luYy5jb20+DQo+U3ViamVjdDogUkU6IFt2MSAyLzJdIGRybS9w
YW5lbDogQWRkIHN1cHBvcnQgZm9yIFRydWx5IE5UMzY2NzJFIHBhbmVsIGRyaXZlcg0KPg0KPkhp
IEtyenlzenRvZiwNCj4NCj4+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+RnJvbTogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPj5TZW50
OiBGcmlkYXksIERlY2VtYmVyIDIyLCAyMDIzIDk6MDQgUE0NCj4+VG86IFJpdGVzaCBLdW1hciAo
UVVJQykgPHF1aWNfcml0ZXNoa0BxdWljaW5jLmNvbT47IGRyaS0NCj4+ZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+Pmtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcNCj4+Q2M6IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc7IEplc3Np
Y2EgWmhhbmcgKFFVSUMpDQo+PjxxdWljX2plc3N6aGFuQHF1aWNpbmMuY29tPjsgc2FtQHJhdm5i
b3JnLm9yZzsNCj4+bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tOyBtcmlwYXJkQGtl
cm5lbC5vcmc7DQo+PnR6aW1tZXJtYW5uQHN1c2UuZGU7IGFpcmxpZWRAZ21haWwuY29tOyBkYW5p
ZWxAZmZ3bGwuY2g7DQo+PnJvYmgrZHRAa2VybmVsLm9yZzsga3J6eXN6dG9mLmtvemxvd3NraStk
dEBsaW5hcm8ub3JnOw0KPj5yb2JoK2Nvbm9yK2R0QGtlcm5lbC5vcmc7DQo+PkFiaGluYXYgS3Vt
YXIgKFFVSUMpIDxxdWljX2FiaGluYXZrQHF1aWNpbmMuY29tPjsgUmFqZWV2IE5hbmRhbg0KPihR
VUlDKQ0KPj48cXVpY19yYWplZXZueUBxdWljaW5jLmNvbT47IFZpc2hudXZhcmRoYW4gUHJvZGR1
dHVyaSAoUVVJQykNCj4+PHF1aWNfdnByb2RkdXRAcXVpY2luYy5jb20+DQo+PlN1YmplY3Q6IFJl
OiBbdjEgMi8yXSBkcm0vcGFuZWw6IEFkZCBzdXBwb3J0IGZvciBUcnVseSBOVDM2NjcyRSBwYW5l
bA0KPj5kcml2ZXINCj4+DQo+PldBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91
dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5DQo+Pm9mIGFueSBsaW5rcyBvciBhdHRh
Y2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFjcm9zLg0KPj4NCj4+T24gMjIvMTIvMjAyMyAx
MjowNywgUml0ZXNoIEt1bWFyIHdyb3RlOg0KPj4+IEFkZCBzdXBwb3J0IGZvciB0aGUgMTA4MHgy
NDA4IFRydWx5IE5UMzY2NzJFIHZpZGVvIG1vZGUgRFNJIHBhbmVsDQo+Pj4gZHJpdmVyLg0KPj4+
DQo+Pj4gU2lnbmVkLW9mZi1ieTogUml0ZXNoIEt1bWFyIDxxdWljX3JpdGVzaGtAcXVpY2luYy5j
b20+DQo+Pj4gLS0tDQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAgICAg
ICAgICAgIHwgICA5ICsNCj4+PiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL01ha2VmaWxlICAgICAg
ICAgICAgICAgfCAgIDEgKw0KPj4NCj4+DQo+PkludGVncmF0ZSBpdCB3aXRoIGV4aXN0aW5nIE5v
dmF0ZWsgZHJpdmVyIG9yIGF0IGxlYXN0IGNvbnN1bHQgaXRzDQo+Pm1haW50YWluZXJzIHdoYXQg
dG8gZG8uDQo+DQo+Tm92YXRlayBudDM2NjcyZSBhbmQgbnQzNjY3MmEgZGlmZmVyIGluIHJlc29s
dXRpb24sIHBvd2VyIG9uL29mZiBzZXF1ZW5jZQ0KPihpbml0IHNlcXVlbmNlLCBkZWxheXMpLCBw
YW5lbCByZXNldCBzZXF1ZW5jZS4NCj5OVDM2NjcyRSBwYW5lbCBzdXBwb3J0cyByZWZyZXNoIHJh
dGVzIG9mIDYwSHosIDkwSHosIDEyMEh6IGFuZCAxNDRIei4gSXQNCj5hbHNvIHN1cHBvcnRzIERT
Qy4NCj5UbyBzdGFydCB3aXRoLCBJIGhhdmUgYWRkZWQgc3VwcG9ydCBmb3IgdW5jb21wcmVzc2Vk
IDYwSHouIEluIHN1YnNlcXVlbnQNCj5wYXRjaGVzLCBvdGhlciBjb25maWd1cmF0aW9ucyBzdXBw
b3J0IHdpbGwgYmUgYWRkZWQuDQo+DQo+SSBoYXZlIGFkZGVkIFN1bWl0IFNlbXdhbCwgbWFpbnRh
aW5lciBvZiBudDM2NjcyYSBwYW5lbCBpbiBjYy4gV2UgZmVlbCBpdCdzDQo+YmV0dGVyIHRvIGhh
dmUgYSBuZXcgcGFuZWwgZHJpdmVyLiBQbGVhc2UgbGV0IHVzIGtub3cgeW91ciB0aG91Z2h0Lg0K
Pg0KPlRoYW5rcywNCj5SaXRlc2gNCg0K
