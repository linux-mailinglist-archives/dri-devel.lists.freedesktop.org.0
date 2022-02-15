Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1114B749B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 20:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DB710E1FD;
	Tue, 15 Feb 2022 19:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Tue, 15 Feb 2022 09:52:49 UTC
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB82610E429;
 Tue, 15 Feb 2022 09:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1644918769;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iw8WzCaDfNAox61c1XTlHvprnyEm93V7Mqc/NxaYPBw=;
 b=IliR9dZsfqY6kFKzpp4zJo6Tn4Em23bXl1rC0CP59UJOkhEcUJIHKV9L
 Yeu3EF1zqdc4Ln+p6JJLbsOS+zHXtRRVCDDHQnozaK4Ed7KM5pdT/FkG9
 gdDQSSh6B/GwpKAz4v3/9acFgxuYWgMYFmAJ6mOgA9M4ZjfL0zvztkE7C k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: Wy0OJLz6BuLKyYyzm2UoNMMOAxz6G/3neQcF9aSpcIkhlg978QlODMMVsPPe3DjUQ6eUeSIp/n
 QCthxswFYy1Li6iyC2ZtdJHyNrkEtlM/dJ0mZo+66T22pj6nB9njXhj83O6ONETK/QicZW5wlU
 opmuewDGpJvhcKVUKcG73ea1cuyrrUmc8Oet+JEl0zRkXdWBKLXmJo94XBUDUJudcj5rt8BtvF
 GHjdDsFOUt9K3t/++aa6dj2bPfJTHQwcNP3FvGRMMHD6Z8J9WbzVRwNVJL4cgkHj2UAE6Ds4s+
 6Tm7v4IVEWwyQ4Vi2lgpkYS8
X-SBRS: 5.1
X-MesageID: 64225888
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
 NBConD9M3BdGH2yqTr/MhBjvdpa+w==
IronPort-HdrOrdr: A9a23:W5eZqKtRS/7uml8SUMgj8fDR7skC7oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzI4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P7wrhJRGdZM8qPuMexzwqC33QRCvyHTcZeg60iH22tbKCItc3pDeRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,370,1635220800"; d="scan'208";a="64225888"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilaZ4q+uZdIfts/UFRJeZaM0CaSfhaUI5TOPze+hbufN+hwg5iWKU+RMjTQULAQhBl99p2QyPToVJweQ/2ilYug59c0JmprjOLhZQDG3ejuxIG3vDoO0TxH0SaQ7yxEQUOyLKzn+g3tF9cpUGtvN39RVhZB0k4Bn6TaPQYvfReDO92Mm3wU89wkzKZM5UHWITDAoRioOk6YKm9ad92P2EEW1CRQvEXwPwvrp3TQpF8GLXF/DYX0A/fiv8r59VxMGtizra6BUFqJMriKPpsMKvytZTVuuJKyyn/BIQHU9Pn4Dsqql31vGLQN6XmAN/jFRqCVGbmcWhsovVEp5APThpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGfL1e1bMDpYfkGiAfrTfHC/8z7eJZ5Kbc5EER5I8Tw=;
 b=g8+HFMAudfrhF88CIlb9USB4nGjlF4auwIeYzZnxFXCbg4+gjWXDgsLiW9mvxTxKAEODZFjcJKVOuXG/mF3DCc7SCg1VEcDmUELS2FfIxT8QnTqBPzAKehh4uJaOe2+JRGiwEwsl83tEXLkmZfZ1UVKZI3aFbEBTwUYI0VaFPSy8z44kxcHyi1KIMWk5JOyMQDbw3ytlnrJxtt2P0Ak+nfRHoQGM0P/y6k6GkeXE/yIZVVjNDuAfd7IwCCExqvi/PqougbcOZOoylnhjhZiEDYZh3XXTUg9NGy7ixAEK4As9so8okofMIfEnghM1FKJ8wDzzGnaHEY3AKmQLzKp0Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGfL1e1bMDpYfkGiAfrTfHC/8z7eJZ5Kbc5EER5I8Tw=;
 b=LNgn9kWhTFP+qaoGPYjaMJr97wkw5aM0jbMVOU7Zv52knzicKXInSAw1GEuD41okAti8/upRUcKLszQsdhK0QdJnyaldk8J2RyLbEgygJkEHUHc948p5HPE44gTp7XPKG4mvavfpk18SKQZVCkGgxiQynn4n3GQQdGMc3DnvsYg=
Date: Tue, 15 Feb 2022 10:45:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Qing Wang <wangqing@vivo.com>
Subject: Re: [PATCH V3 1/13] block: xen: use time_is_before_eq_jiffies()
 instead of open coding it
Message-ID: <Ygt2Pr26MHOMGgR1@Air-de-Roger>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
 <1644890154-64915-2-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1644890154-64915-2-git-send-email-wangqing@vivo.com>
X-ClientProxiedBy: LO3P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32826cc3-a767-4fe8-891b-08d9f067ec86
X-MS-TrafficTypeDiagnostic: MWHPR03MB3053:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB3053FA0087E2C31570D06F3F8F349@MWHPR03MB3053.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XwIKyJ1rEAvRB1r6HE88BUpHD6Uz5+G+3zSYNOGigqz7NUTie21YXIqvuU92NqBmDn1nEe6TixP1P9GtV9kGSmnT8Vwgc19Z2lp3C4QZ6/CjCW59WUnCC45bousTjDOBRst8ivXWUQzhtLh35raiJeMPVuhETHIRYjwMsGFYAqcpzk4mHMkhYh4BM41r3YSHn81+32lkPMR8hfMfpv9TGrljmgUFDf9LjzTsKggo3sGJX1sw7aKO27JkXUWgVJghQ7JdIzLPYk+6xRJ1fQggmAEygybuwCCmWXUgCm17rAoi/5cP9XIT/1fxDEWXHqkJml+tMDNRXFTkgkYw+HZRfyXM5fHpZSNaaOyakz9OrexvvD9kHh7aRZefDTkBvUVEpbunNo1Vx2iJ/4jRRbcodDeOi5y44NK+xRwMAiOtVj4dRdvAH3ADF69BndhDJlfK6AUZ4708oRQIQLpFj4jdHSIWgPzy6pfn2A4ZGn/2q5lg39/1u4llA3xZrWUCszX0SaDzb5nZjppoq0bHWESPRtGwqBIpiqKf5lLczaJnAQk1VFU1D6Go3axvQa1KAIDY0Fp12NNs8kw5rkQLTF94F3BJQ2ZRH4Hy6AmY/9nOcwHQ6lx8eMfqJjl2XCUxqxowKpwaYYEp6NaUnEJSSKDJHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR03MB5608.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(8676002)(66476007)(66556008)(4326008)(558084003)(9686003)(33716001)(6512007)(6666004)(86362001)(85182001)(66946007)(508600001)(8936002)(6506007)(5660300002)(7416002)(6486002)(7406005)(316002)(26005)(186003)(38100700002)(6916009)(82960400001)(2906002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q09ReHgwWUdvalprSjFvZXhkNTBSNkl1azRTa2ZUZTBZVWNEdzhYNmtuSWxX?=
 =?utf-8?B?UWR5U2owVUUySG02WlNTdUpuRjVvNnVPdTZkMzF2MWw2QUZFWWZsT0NJakJ6?=
 =?utf-8?B?bkRpNURuYXlpQXZaWTRwQUVIa2pKTEtWOGMvbWNkcmZHNkdSK3ZaYm80UE1n?=
 =?utf-8?B?T0hwRlF4L1BpNlR3bmNDUmRYTkJUMzdGM3cxbmY5UmllUGE0M0tnSTVYNUNa?=
 =?utf-8?B?YTdLa2tNdXVmNG5JQlBQV1ZkUmRHaStOc0hEc3lpVENTd0dVYXFPbnlJbkN1?=
 =?utf-8?B?eWNNbVN2SWZPSkl0SGZEb2h3c1J5MEdMWnVRbDdtcVgvVENNRjdWMlhtZHpZ?=
 =?utf-8?B?V1RFQUI2RjNjc3lBR0pyVnRHZ01SRjBLU25GUjIzR2RPMWtvZk92Vi9tZTFR?=
 =?utf-8?B?UHNDYzExdjdrN3RjUG9pSUxFWHpXL1pQcVJJRVFVa0hUTXBEdGFyRTFkdmIv?=
 =?utf-8?B?bm9pMmt4bWdENEtwdWZMRUc4a21QR1hqbGpjS2JJbktYV3IvbVZod0NaRHFI?=
 =?utf-8?B?QUpjSk80WFlPbUlHUi9icURicW5uMGp6bkJRcDhPVjRQeklnUFBFU1A0TUcw?=
 =?utf-8?B?ZlBPd0U0RGhKUFBnb0g1TEVPajVQTERrb2hwUmZ0T2F1eVQ2VE1nYnZYWFph?=
 =?utf-8?B?b2RreDZHVEJrbjN6OEg5WVZKZW9LVTNMcVhqV2NTTWNVdHpqckU2WGJjYkNC?=
 =?utf-8?B?TzlXdCtGNmk2N05VakVPM1NJZ00yRG1meEVGOVZiNElERGxuUitIWTFDekJx?=
 =?utf-8?B?aDloV0RtUEVvWVVHVDg4QVF3L09mQlY1b1k2MmtjOWJwN0NRVWc2VC8zc2wr?=
 =?utf-8?B?S0xiOXlYK284WmJrRloyUXZZSHFYYkE4OE1TVmtRRHhNbHo0L2NnK1puOUVC?=
 =?utf-8?B?TmZWSm8wVVdhY0g5WjVnUnJkWFBJOGhsaHlOWG1hSm1MOUUwbE1XVEZ6bzVs?=
 =?utf-8?B?OCt0UGN6Umd0Q1lXM25RSTdoT0lkcUl4NklvVjFsbVk1TGk1dW95ZlZyQnc4?=
 =?utf-8?B?MzQycXFZbjBIbEZtcXRtV0pzSFk2NnRHOFpLa3pFTEFuYzdVWmF2VTRiYVZ6?=
 =?utf-8?B?Y1dNaXdORnBDSFlBa3FwdGZQSFFOL0Q5MGs1c0lMbTkxL0xwSEJiNngwV25q?=
 =?utf-8?B?am1ZNVQyUEZUNlYrZjA0OFRHenVZamlZVjd1TUVNVFZ5aEdEQ3M2UGZmZk9B?=
 =?utf-8?B?R1AzZUVqYVV5eW1kTDF0d1pJZmZ3a3NhcmMwREprWnVxOWpNRGwvbW5NcWVi?=
 =?utf-8?B?dWU3UlU2WkExSW5KR2tQMTkvVU42MnlmZ01XWGU3RGhIZUMycnJYNG96aURv?=
 =?utf-8?B?Vktxcmp0YzVaTUJhV0swRUFpUHdIbk9seG0zQlRvbWVKdldYK216THpTU2tz?=
 =?utf-8?B?REEwOHcrb0RHcXNMbkF4Nm9iQmNkMERjTi9kV1NidG4xSVVaL3gweVFmclNu?=
 =?utf-8?B?MXpla0hmU3lEVzNSLzcvdU1zNXV0cUplOHhQbmk0aHMzdS91aDBqaUk5R25o?=
 =?utf-8?B?RWNUVWtiTGVDOEZmempoV3NPMUVsS2JYbmVPaVdIK1JMaEtLbDFJaUt1NHN6?=
 =?utf-8?B?QTNoTUk0K3NCdlV3TkVrU2g1SzFLRnhkODMrVFJGcWYwT3ZwUUpwSlBmbTVB?=
 =?utf-8?B?TkQwd1Q3TFhtWHJqbTZkMWVDMEFzWEhUbUc5S3gwbkphT1ZCdkVRVnVrbk9C?=
 =?utf-8?B?b1crS1lmWlhaSjUxZG43N1ZHZTdPZ1l0d1RTQThvS2JtVGxmSmtRZXdRUDRB?=
 =?utf-8?B?T0xtNXFUWGtON2tlM05FZ25VcmdjblpaelozRnpydU0vU0F0R3BCSEFZdHY5?=
 =?utf-8?B?ay8wZzRrQ3NyZU1TL3FFVGwxeEphSzhicW1aTUUxbi9Ec042cERpSERsNkNn?=
 =?utf-8?B?YW8vOStLOWRuWStJSzYzVCt0dWk4cFpveDJnMmxDeDZjbytOb0NHOTlLUDZn?=
 =?utf-8?B?TkVoL2dRTzlHd3JON0cvV0kyck1GZlM4TEdpYnpOMjlNL29BQmRQdkdkU3lo?=
 =?utf-8?B?T2U4SEpGeDBxa1FGYUlBTjgvVXhQQndFOVVhckdDVzdFenRaMk9MSzRZMGtK?=
 =?utf-8?B?RW9EUlpZeWhIVzI3c0Yxb2JNZ2FOMUMzbG1Od2l2ZWJTYm9kMm1yNHBMR3h0?=
 =?utf-8?B?UGUxeW9TRGRPL2JaaC96L05qSCsrR09tZkxEWWVuUU5RRjlPTU5KNVBNWFM5?=
 =?utf-8?Q?RgJs9iDivClS1Q9nXOcWIRM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32826cc3-a767-4fe8-891b-08d9f067ec86
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 09:45:39.1735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCZULRE0ypM1MYAFyBxumnnbHYB9R4P24gzY44d0kV4TkZA/k/jKXVcffojdAGeVleKqo682MpIuIeFVQsferg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3053
X-OriginatorOrg: citrix.com
X-Mailman-Approved-At: Tue, 15 Feb 2022 19:19:07 +0000
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mike Snitzer <snitzer@redhat.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, dm-devel@redhat.com,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 linux-clk@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
 amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-media@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, Jiri Kosina <jikos@kernel.org>,
 linux-block@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Stephen Boyd <sboyd@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 05:55:38PM -0800, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> Use the helper function time_is_{before,after}_jiffies() to improve
> code readability.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.
