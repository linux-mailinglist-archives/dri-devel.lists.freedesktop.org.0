Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B40F78CD18
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 21:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F54A89D60;
	Tue, 29 Aug 2023 19:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2051.outbound.protection.outlook.com [40.107.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B192089263;
 Tue, 29 Aug 2023 19:40:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSj/CvSvL9aRXpw33EVzBB9jzVtTXXf8FQwCf+oPW6othA58XI3sSq3gfuViAuXlogXnKqrGn38MgchqhVNjVWsiF/f+7GgEvBqOo4ohxZAtEYETGBTljxF6nMpEqwnGO3O8iB0IxQbI/yPjQlhd1KGM5eURJCznLEEGXeg7T8YTIk/3xxciqQV2lB7YU8uGY1JKSX+LFWDJG5+bZTIhj7bPtU/tdI/M7N3WC329fyo1RVtcNrPLe+8kzjaTvB5a89+H8kALkOB4CouoolqQp1xbaZBfDywV6XxFSE//wnbc7zInS0pZKC4yu9Cw1gbITqY91wh2iy/dFBZlHXLuNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waw5i+TZCADOX9G501UwCpUUBilFyboCKw4sb/e2kNI=;
 b=Vrpuzt7LZB5UtkvdEH6izXi99o2uF/wZRuVlf7UiEjcnsuI7epUoOro0XgQhitHKzpQfcwxp/N+hDJsgnNol+jwWr34obiDhGs8FfhRRVz1/jSvJQ5LS8FKlsrO3azsAvBRh0I1ef1ioXCweKT97hqOMK1rFeP/2NmcaSoKugPUUuQYraqYmwEaNjQiQ0m3PdpiszIC1Q8/GmiEdPISMkbIb8wGsWBbfj6bMqGTpbhCdXksD9ipw6bFftbpQzLu/VFnoDFec5dTS9zyovyQqTNsirTXXMENaB3jpRm0EhwiJFOjtb8iypw89TqrrAJsJ7pAMukDBfRIahQ6GvETptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waw5i+TZCADOX9G501UwCpUUBilFyboCKw4sb/e2kNI=;
 b=UKYqgRze5BNvDbEZYphYWiwMCHq3/9Lfe7oVKjRJ9yKIKXjXCBUjF4eYTAFd63wFRyUCpTYiJButAKJejDk5vjNHuoxmVqyNa8xKUCs0SZsu1UVZEAU0qmLGr4QEMe+dE7XK2hct8PzkdSDesSt+eh0NcRQF9QZ6TMrqyq4yLzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB9422.namprd12.prod.outlook.com (2603:10b6:8:1bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 19:40:19 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 19:40:18 +0000
Message-ID: <73c0d398-63fe-4ce1-92db-f0f1f5e839a3@amd.com>
Date: Tue, 29 Aug 2023 15:40:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/33] drm/doc/rfc: Add RFC document for proposed Plane
 Color Pipeline
Content-Language: en-US
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230829160422.1251087-1-uma.shankar@intel.com>
 <20230829160422.1251087-2-uma.shankar@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230829160422.1251087-2-uma.shankar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::8) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cdcff71-1983-480a-a78e-08dba8c7c695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2DgEqBSRybIt3xinQJlD6/oV9aqskQvff9+O9k241zehtZKQkCCLJsjWDXUekF9ytkAnSPKlDHKHZQqmXReafCpq0D2r7CORay07jZfE66hNA+4rpjBsS+UKZMLieEgtD3g++5H5EsxoassqtdAgVd1SgZH6DBzvRlKb9R+ULDN2xUS8PZKu+3G9DSUBk/zkQ+NrwhEYLM1uoYmBk6sr5cAJqABWVnrg2PznSyNHvEa2sN+FLkpms/RSFlViqNfcU803DnqaB0xui+Sd3QB9pUz3k/bWwiRs7wXJGbNaSJSwbqIpkqeJndaqBNa47OaXqWnEyRjRdMOam6atbOVTfjVVe1xYnTrpz3XK0FYEat7GQRYLc/bgVTrq5CshkoVsIfeEjfy3GBB1FE5+NMFuqLYKIRH7TQvCbzGLAMI9drLufUzb1xQL1nKLTl0zwZXM5q3oifdkkpdCEiTkp/CPmRqypo5JwJbr+FYukuqowOpXJlSxvTw/aQnTW+qmAz+u8fe8jqmIXtU0CQ7qfw5K/Wz1Ao7MESDsa60VqIQM96L6WfTsIB2DVx/DwBjh10P0uCxtiQbes/v/v5djWzE7CzvB0gG43eee0vAMf2Z1A7vBaS3ZxmL3oUHwTDTdw0xQbRWhGpp2DONXyK2n54eyRnu12QbYdK7Ag/QnqeioLJ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199024)(186009)(1800799009)(6506007)(6666004)(53546011)(6512007)(6486002)(2616005)(31696002)(2906002)(5660300002)(44832011)(86362001)(30864003)(66476007)(38100700002)(36756003)(4326008)(66946007)(41300700001)(8936002)(66556008)(8676002)(316002)(966005)(478600001)(83380400001)(26005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVZqRHJIci8wUE91WHBLb3JPRW5tWkpJbXBpZ3ZVYmZUV3dJYWxhSUJQRzU0?=
 =?utf-8?B?b1ovcTVFTEl3elYzSWgzdEs1UUpucDBxODQySGRXS0tNeldiVlZXTzhoMXNp?=
 =?utf-8?B?OHRtc28xc1hXa2lSR2FBSEVLN1AyK2hsRW9xTXk4eEdVVlkzZFRwemVTeXNQ?=
 =?utf-8?B?VVZUL3ZBRk1SbWFnWHhORStyclpubU1FdXdCdlNhalBNcUdycHllZm9aMjZn?=
 =?utf-8?B?UnFTeVhkUkpQNHM4Z2RuZXoyeXgrc3h3MjlZdW04YlZQMDhLTEVVUXBhQ1Y1?=
 =?utf-8?B?RFZ1QlN5bFFaN3huNFlVdDRhdjIyOVRrQlhBbThDNlFUSnJ5RVU1RVNqUnd6?=
 =?utf-8?B?aGxudWJaZ21DclNacE1OZldLcmxMc0pSNjJTd0M1TFFlZmt4MktOWVpydUFN?=
 =?utf-8?B?MjVReHV5MkczZFBlM09vS1ZKbDkxMm1yNkxWVS9OSFdTRjdnQlkyYUN0VE5m?=
 =?utf-8?B?MEZWRExXZFJTV2YxWmdZUGRWbVlkNGtEWU1zcjIybnFjTHVwSWRKc2V4c0pn?=
 =?utf-8?B?MkZGVy96dFBmd3RyVG1hUjRuUnlnYXpFenFoSDJvYTFXL1pVdzYrVGdzejN2?=
 =?utf-8?B?U1NpcHEzWnJEMzhheVZoUXVMNEFYbnVrWC9XQTA1b2NLc0lCaXJRcm5Ja25z?=
 =?utf-8?B?OWZ3WXFqMGhmQXRLalhRUFFnV2ROTHduU0pPNGN6MnM0M284cndmU1lFQlIx?=
 =?utf-8?B?K1p0SEM5UkJ0RnhCendoeUhnUkwxa3kzK045enRndGJJODVoa2syTkc3STB0?=
 =?utf-8?B?a3VnWXEzdHBVbEppNFhXSU12bTV4WkdiSUpqMU9CYXJtTjYvRWVLWGs1U2Zt?=
 =?utf-8?B?U0VjWWdtdDRoOFJHZG5LZGI2YnlFcGNYamx0YmU5ckZlejU3QnZYL1N5aVRm?=
 =?utf-8?B?SVJhR2x1anRTS09OUC9NbmMzMFhteHBPTkZHZm1Mb2JMdFlSVE5xaGhmQzhl?=
 =?utf-8?B?U09JZnhzSnNibG1tNDZrR0pNYUtKY25UR0M0ZEVLWklnMjhjaXZRMTVuVm5B?=
 =?utf-8?B?ODRtVkVGSmJJUDFBbUlqWkdMeDQ4ZEFtUXRNZktwbEtka3FLZkdXZDRKR3I5?=
 =?utf-8?B?UDlDR1owQXQxdWE1cHc5TXJoOUM0MnpLZ2JrdFAydUNlL0xDT3BaTnVCQlZy?=
 =?utf-8?B?cnNVaFVXRjRWMFQ2OHQ2blVWbGFqRGVwOVNnTy9WMzNSdVJ5a0lQTzYyUWht?=
 =?utf-8?B?bWI3MjdpRlNzZy9FYzhRTlpnM21iWjQ4MFc0cU52clRLbFprWWpHUHpmdVd3?=
 =?utf-8?B?NzVUY2JncGNHRmZPWEliZDN3Z3kxK0c2NGdVVWd6QXVHTmUyb3JQUHJvN0F3?=
 =?utf-8?B?dkhvNEdIanFNbjBFYmVuaFNQd2k5cHV0aHhpSDl6WEszV1pHTVNJVFZTd0JG?=
 =?utf-8?B?a1pvejB3VnVTV2FZaXByMzlSS0hMa3AzSnluSUh4TlQ0RVBad3o4ZXkwcENG?=
 =?utf-8?B?V0NxZGRJcUcrQkVZTDZKcjF4ZHpxWUpFUGJZYmdMNjlJaHJPa24yUktIWVhw?=
 =?utf-8?B?bW1QZHNIMzNGek9EY1R5OXQ4OVM5cWw3enB1MXBpcWx5TU9Nd2JON0I0U2k1?=
 =?utf-8?B?aHlhd3o2am9lSDVRMCtrcHMzOVJkK0lsNXJnVWZXTDJmV2VsRmgyU0YwTEt4?=
 =?utf-8?B?MFE3d2NTQlREcWRqRW5RNmpFWlBVNkpRMGF4T0pVUVlyYk1UZWpob2xCQnRE?=
 =?utf-8?B?ajNWQ0s1eXFVTFlkRXBJbTFKNlNKSzB2YlFMSFd2YjJKM1pvWWJYUGJ1Yy80?=
 =?utf-8?B?TU9vWkkvZnZ1SUdJL0N4bW9VRHJqSmxHV3ViNEkwaW9EclB1cHFXN2ZSMDFV?=
 =?utf-8?B?ZUNwendGdW81Y3ZhU3BPZDR1dEtzL1RoTE1obDB6MTJ3c3NKdEgySmZrTWVS?=
 =?utf-8?B?dzY3eTBLMWwxZ0dWb0k5S3V1TkdVUVpZbjFwVEVrM2FOOXBPdzJrNGJaVWp4?=
 =?utf-8?B?c1Fub05pN1lKeFVEZDBocVBLQnByVzNJYnY0K2E2U2dyZFNDY3k3NW1NVFli?=
 =?utf-8?B?VmpFRmxWNklydElMZUV6NndvWkZxekRWaWY2RE80ZkF1UWdibkhXWkZ6TjUw?=
 =?utf-8?B?WlRZVVczOHAweHRzUzJDa1U3REdvOVNVOExqSmZXV2x5alp2ZVh6OURyWC9H?=
 =?utf-8?Q?LO3XXS5jNP/GPXQu/IZlWgaR4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cdcff71-1983-480a-a78e-08dba8c7c695
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 19:40:18.8817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m46lOBNorZDUH6NqdMnAOOlHEsyIyzsY6aarimI3jPaDi4Yd7oebUj/m64QHhqV7R1ZB3jwVjP1tQ8RLtWkAyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9422
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
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-29 12:03, Uma Shankar wrote:
> Add the documentation for the new proposed Plane Color Pipeline.
> 
> Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>   .../gpu/rfc/plane_color_pipeline.rst          | 394 ++++++++++++++++++
>   1 file changed, 394 insertions(+)
>   create mode 100644 Documentation/gpu/rfc/plane_color_pipeline.rst
> 
> diff --git a/Documentation/gpu/rfc/plane_color_pipeline.rst b/Documentation/gpu/rfc/plane_color_pipeline.rst
> new file mode 100644
> index 000000000000..60ce515b6ea7
> --- /dev/null
> +++ b/Documentation/gpu/rfc/plane_color_pipeline.rst
> @@ -0,0 +1,394 @@
> +=======================================
> + Plane Color Pipeline: A UAPI proposal
> +=======================================
> +
> +To build the proposal on, lets take the premise of a color pipeline as shown
> +below.
> +
> + +-------------------------------------------+
> + |                RAM                        |
> + |  +------+    +---------+    +---------+   |
> + |  | FB 1 |    |  FB 2   |    | FB N    |   |
> + |  +------+    +---------+    +---------+   |
> + +-------------------------------------------+
> +       |  Plane Color Hardware Block |
> + +--------------------------------------------+
> + | +---v-----+   +---v-------+   +---v------+ |
> + | | Plane A |   | Plane B   |   | Plane N  | |
> + | | Pre-CSC |   | Pre-CSC   |   | Pre-CSC  | |
> + | +---+-----+   +---+-------+   +---+------+ |
> + |     |             |               |        |
> + | +---v-----+   +---v-------+   +---v------+ |
> + | |Plane A  |   | Plane B   |   | Plane N  | |
> + | |CSC/CTM  |   | CSC/CTM   |   | CSC/CTM  | |
> + | +---+-----+   +----+------+   +----+-----+ |
> + |     |              |               |       |
> + | +---v-----+   +----v------+   +----v-----+ |
> + | | Plane A |   | Plane B   |   | Plane N  | |
> + | |Post-CSC |   | Post-CSC  |   | Post-CSC | |
> + | +---+-----+   +----+------+   +----+-----+ |
> + |     |              |               |       |
> + +--------------------------------------------+
> ++------v--------------v---------------v-------|
> +||                                           ||
> +||           Pipe Blender                    ||
> ++--------------------+------------------------+
> +|                    |                        |
> +|        +-----------v----------+             |
> +|        |  Pipe Pre-CSC        |             |
> +|        |                      |             |
> +|        +-----------+----------+             |
> +|                    |            Pipe Color  |
> +|        +-----------v----------+ Hardware    |
> +|        |  Pipe CSC/CTM        |             |
> +|        |                      |             |
> +|        +-----------+----------+             |
> +|                    |                        |
> +|        +-----------v----------+             |
> +|        |  Pipe Post-CSC       |             |
> +|        |                      |             |
> +|        +-----------+----------+             |
> +|                    |                        |
> ++---------------------------------------------+
> +                     |
> +                     v
> +                Pipe Output
> +
> +Each plane consists of the following color blocks
> + * Pre-CSC : This block can used to linearize the input frame buffer data.
> +             The linear data then can be further acted on by the following
> +             color hardware blocks in the display hardware pipeline
> +
> + * CSC/CTM: Used to program color transformation matrix, this block is used
> +            to perform color space conversions like BT2020 to BT709 or BT601
> +            etc. This block acts on the linearized data coming from the
> +            Pre-CSC HW block.
> +
> + * Post-CSC: This HW block can be used to non-linearize frame buffer data to
> +             match the sink. Another use case of it could be to perform Tone
> +             mapping for HDR use-cases.
> +
> +Data from multiple planes will then be fed to pipe/crtc where it will get blended.
> +There is a similar set of HW blocks available at pipe/crtc level which acts on
> +this blended data.
> +
> +Below is a sample usecase fo video playback with sub-titles and playback
> +controls
> +
> +┌────────────┐    ┌─────────────┐     ┌─────────────┐    ┌─────────────┐
> +│FB1         │    │PRE-CSC      │     │ CTM Matrix  │    │ POST-CSC    │
> +│            ├───►│Linearize    ├────►│ BT709 to    ├───►│ SDR to HDR  │
> +│BT709 SDR   │    │             │     │ BT2020      │    │ Tone Mapping├─────┐
> +└────────────┘    └─────────────┘     └─────────────┘    └─────────────┘     │
> +(subtitles)                                                                  │
> +                                                                             │
> +┌────────────┐    ┌─────────────┐     ┌─────────────┐    ┌─────────────┐     │
> +│FB2         │    │PRE-CSC      │     │ CTM Matrix  │    │ POST-CSC    │     │
> +│            ├───►│Linearize    ├────►│ BT601 to    ├───►│ SDR to HDR  ├───┐ │
> +│BT601 SDR   │    │             │     │ BT2020      │    │ Tone Mapping│   │ │
> +└────────────┘    └─────────────┘     └─────────────┘    └─────────────┘   │ │
> +(Playback controls UI)                                                     │ │
> +                                                                           │ │
> +┌────────────┐    ┌─────────────┐     ┌─────────────┐    ┌─────────────┐   │ │
> +│FB2         │    │PRE-CSC      │     │ CTM Matrix  │    │ POST-CSC    │   │ │
> +│            ├───►│Linearize    ├────►│ BT601 to    ├───►│ SDR to HDR  ├─┐ │ │
> +│BT2020 HDR  │    │             │     │ pass-through│    │ pass-through│ │ │ │
> +└────────────┘    └─────────────┘     └─────────────┘    └─────────────┘ │ │ │
> +(video frame)                                                            │ │ │
> +                                                                         │ │ │
> +┌────────────────────────────────────────────────────────────────────────┴─┴─┘
> +│
> +│ ┌─────────────┐      ┌─────────────┐      ┌───────────────┐
> +│ │ CRTC        │      │ CRTC        │      │ CRTC          │
> +└─┤ PRE-CSC     ├─────►│ CSC/CTM     ├─────►│ POST-CSC      ├─────► TO Port
> +  │             │      │             │      │               │
> +  └─────────────┘      └─────────────┘      └───────────────┘
> +
> +This RFC is intended to propose an uAPI for the pre-blending color pipeline
> +(however, can be also extended to post blending pipeline).
> +
> +Below are the design considerations while designing the uAPI.
> +
> +1. Individual HW blocks can be muxed. (e.g. out of two HW blocks only one can be used)
> +2. Position of the HW block can be programmable
> +3. LUTs can be one dimentional or three dimentional
> +4. Number of LUT entries can vary across platforms
> +5. Precision of LUT entries can vary across platforms
> +6. Distribution of LUT entries may vary. e.g Mutli-segmented, Logarithmic,
> +   Piece-Wise Linear(PWL) etc
> +7. There can be parameterized/non-parameterized fixed function HW blocks.
> +   e.g. Just a hardware bit, to convert from one color space to another.
> +
> +Plane Color Pipeline: Design Proposal
> +=====================================
> +Each Color Hardware block will be represented by the structure drm_color_op.
> +
> +struct drm_color_op {
> +	enum color_op_block name;
> +	enum color_op_type type;
> +	u32 blob_id;
> +	u32 private_flags;
> +};
> +
> +The members of which will constitute:
> +1. name: A standardised enum for the color hardware block
> +2. type: The type of mathematical operation done by the hardware block.
> +         e.g. 1D Curve, 3D Curve, Matrix etc.
> +3. blob id: Id  pointing to a blob containing information about the hardware
> +         block advertising the respective capabilities to the userspace.
> +         It can be an optional field depending on the members "name" and "type".
> +4. private_flags: This can be used to provide vendor specific hints
> +         to user space
> +
> +
> +   For example to represent LUTs, we introduce the drm_color_lut_range
> +   structure. It can represent LUTs with varied number of entries and
> +   distributions (Multi segmented, Logarithmic etc).
> +
> +   struct drm_color_lut_range {
> +		/* DRM_MODE_LUT_* */
> +		__u32 flags;
> +		/* number of points on the curve */
> +		__u16 count;
> +		/* input/output bits per component */
> +		__u8 input_bpc, output_bpc;
> +		/* input start/end values */
> +		__s32 start, end;
> +		/* output min/max values */
> +		__s32 min, max;
> +   };
> +
> +Note: More details on exact usage and implementation of this structure can be
> +      found in the RFC. This structure is taken as is from the series.
> +      https://patchwork.freedesktop.org/series/90825/
> +      However, we can add more members to it to encompass all use-cases.
> +      For example. we can add a precision field to advertise the
> +      bitdepth of the LUTs. Similarly, we can reserve some bits in the flag
> +      field for vendor specific use cases.
> +
> +      At the same time, we don't need to pass any additional information for the
> +      CSC block as userspace and driver already agrees struct drm_color_ctm as
> +      a uAPI to pass on data.
> +
> +These color operations will form the building blocks of a color pipeline which
> +best represents the underlying Hardware. Color operations can be re-arranged,
> +substracted or added to create distinct color pipelines to accurately describe
> +the Hardware blocks present in the display engine.
> +

What do you mean when you're talking of re-arranging, or subtracting 
color operations?

> +In this proposal, a color pipeline is represented as an array of
> +struct drm_color_op.
> +
> +struct drm_color_op color_pipeline_1[]
> +
> +For example to represent the pre-blending color pipeline as described above
> +
> +We can create a color pipeline like this.
> +
> +struct drm_color_op color_pipeline_1[] = {
> +	{
> +		.name = DRM_CB_PRE_CSC,
> +		.type = CURVE_1D,
> +		.blob_id = 0; /* actual value to be populated during plane
> +						 initialization*/
> +	},
> +	{
> +		.name = DRM_CB_CSC,
> +		.type = MATRIX,
> +		.blob_id = 0;
> +	},
> +	{
> +		.name = DRM_CB_POST_CSC,
> +		.type = CURVE_1D,
> +		.blob_id = 0;
> +	},
> +};
> +
> +Then, for individual color operation, we add blobs to advertise the capability
> +of the particular Hardware block. In case of the example pipeline, we add
> +blobs of type drm_color_lut_range for the "pre-csc" and "post-csc".
> +For the "csc" block we pass no blob id to user space as it is known to both
> +user space and driver that drm_color_ctm structure is to be used for such
> +operation.
> +
> +To represent, this in a diagram.
> +
> +   struct drm_color_op color_pipeline_1[]
> +      +---------------------------+
> +      |                           |           drm_color_op
> +      |  +---------------------+--+-----------+---------------------+
> +      |  |                     |  |           |                     |
> +      |  |                     |  |           | +-----------------+ |
> +      |  |                     |  |           | |     name        | |
> +      |  |                     |  |           | +-----------------+ |
> +      |  |                     |  |           | |     type        | |
> +      |  |    color_op_1       |  |           | +-----------------+ |
> +      |  |                     |  |           | |     blob id     | +--------+
> +      |  |                     |  |           | +-----------------+ |        |
> +      |  |                     |  |           | |     private     | |        |
> +      |  |                     |  |           | |      flags      | |        |
> +      |  |                     |  |           | +-----------------+ |        |
> +      |  |                     |  |           |                     |        |
> +      |  +---------------------+--+-----------+---------------------+        |
> +      |                           |                                          |
> +      |                           |                                          |
> +      |  +---------------------+  |                                          |
> +      |  |                     |  |           drm_color_lut_range            |
> +      |  |    color_op_2       |  |           +-------------------------+    |
> +      |  |                     |  |           |                         |    |
> +      |  |                     |  |           | +---------------------+ |    |
> +      |  +---------------------+  |           | | segment 1 {         | |<---+
> +      |                           |           | |  ...                | |
> +      |  +---------------------+  |           | |  .input_bpc = 16,   | |
> +      |  |                     |  |           | |  .output_bpc = 16,  | |
> +      |  |    color_op_3       |  |           | |  ...                | |
> +      |  |                     |  |           | | }                   | |
> +      |  |                     |  |           | +---------------------+ |
> +      |  +---------------------+  |           |                         |
> +      |             .             |           | +---------------------+ |
> +      |             .             |           | | segment 2 {         | |
> +      |             .             |           | | ...                 | |
> +      +---------------------------+           | | }                   | |
> +                                              | |                     | |
> +                                              | |                     | |
> +                                              | |                     | |
> +                                              | +---------------------+ |
> +                                              |            .            |
> +                                              |            .            |
> +                                              |            .            |
> +                                              +-------------------------+
> +
> +
> +
> +This color pipeline is then packaged within a blob for the user space to
> +retrieve it. Details can be found in the next section
> +

Not sure I like blobs that contain other blob ids.

> +Exposing a color pipeline to user space
> +=======================================
> +
> +To advertise the available color pipelines, an immutable ENUM property
> +"GET_COLOR_PIPELINE" is introduced.
> +This enum property has blob id's as values. With each blob id representing
> +a distinct color pipeline based on underlying HW capabilities and their
> +respective combinations.
> +
> +The following output of drm_info [1], shows how color pipelines are visible
> +to userspace.
> +
> +├───Plane 0
> +    │   ├───Object ID: 31
> +    │   ├───CRTCs: {0}
> +    │   ├───Legacy info
> +        ...
> +    │       ├───"GET_COLOR_PIPELINE" (immutable): enum {no color pipeline,
> +						color pipeline 1, color pipeline 2}= no color pipeline
> +
> +To understand the capabilities of individual pipelines, first the userspace
> +need to retrieve the pipeline blob with the blob ids retrieved by reading the
> +enum property.
> +
> +Once the color pipeline is retrieved, user can then parse through
> +individual drm_color_op blocks to understand the capabilities of each
> +hardware block.
> +
> +Check IGT series to see how user space can parse through color pipelines.
> +Refer the IGT series here: https://patchwork.freedesktop.org/series/123018/
> +
> +Setting up a color pipeline
> +===========================
> +
> +Once the user space decides on a color pipeline, it can set the pipeline and
> +the corresponding data for the hardware blocks within the pipeline with
> +the BLOB property "SET_COLOR_PIPELINE".
> +
> +To achieve this two structures are introduced
> +
> +1.	struct drm_color_op_data: It represents data to be passed onto individual
> +							  color hardware blocks. It contains three members
> +                      a) name: to identify the color operation block
> +                      b) blob_id: pointing to the blob with data for the
> +                                  corresponding hardware block
> +
> +	struct drm_color_op_data {
> +		enum color_op_block name;
> +		u32 blob_id;
> +	};
> +
> +2.	struct drm_color_pipeline: This structure represents the aggregate
> +                                   pipeline to be set. it contains the following  members
> +					  a) num: pipeline number to be selected
> +					  b) size: size of the data to be passed onto the driver
> +					  c) data: array of struct drm_color_op_data with data for
> +                                                   the hardware block/s that userspace wants to
> +                                                   set values for.
> +
> +	struct drm_color_pipeline {
> +		int num;
> +		int size;
> +		struct drm_color_op_data *data;
> +	};
> +
> +	User can either:
> +	1. send data for all the color operations in a pipeline as shown in [2].
> +	   The color operation data need not be in order that the pipeline advertises
> +	   however, it should not contain data for any
> +	   color operation that is not present in the pipeline.
> +
> +	   Note: This check for pipeline is not yet implemented but if the
> +	   wider proposal is accepted we have few solutions in mind.
> +
> +	2. send data for a subset of color operations as shown in [3].For the
> +	   color operation that userspace does not send data will retain their
> +	   older state.
> +
> +	3. reset/disable the pipeline by setting the "SET_COLOR_PIPELINE" blob
> +	   property to NULL as shown in both [2] and [3]
> +
> +	4. change the color pipeline as demonstrated in [3].
> +	   On the new pipeline, the user is expected to setup all the color hardware block
> +	   Once the user requests a pipeline change, the driver will provide it a clean slate
> +           which means that all the data previously set by the user will be discarded even if
> +           there are common hardware blocks between the two(previous and current) pipelines.
> +
> +IGT implementation can be found here [4]
> +
> +Representing Fixed function hardware
> +====================================
> +
> +To provide support for fixed function hardware, the driver could expose vendor
> +specific struct drm_color_op with parameters that both the userspace and
> +driver agrees on. To demonstrate, let's consider a hyphothetical fixed
> +function hardware block that converts BT601 to BT2020.
> +The driver can choose to advertise the block as such.
> +
> +struct drm_color_op color_pipeline_X[] = {
> +	{
> +		.name = DRM_CB_PRIVATE,
> +		.type = FIXED_FUNCTION,
> +		.blob_id = 45;
> +	},
> +}
> +
> +Where the blob represents some vendor specific enums, strings or any other
> +appropriate data types which both the user-space and drivers are aligned on.
> +
> +blob:45 {
> +	VENDORXXX_BT602_TO_BT2020,
> +};
> +
> +For enabling or passing parameters to such blocks, the user can send data
> +to the driver wrapped within a blob like any other color operation block.
> +
> +	struct drm_color_op_data {
> +		.name = DRM_CB_PRIVATE;
> +		.blob_id = 46;
> +	} ;
> +
> +where blob with id 46 contains data to enable the fixed function hardware(s).
> +

One major thing missing from the RFC is an explanation on why we want to 
go with a prescriptive model, rather than a descriptive model. This 
question came up in Dave's response to Simon's RFC:
https://lore.kernel.org/dri-devel/CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com/

This is a rough attempt at such an explanation:
https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5/diffs?commit_id=bc99737623796b39925767d6f8cbc097ad0b4d8d

Harry

> +References
> +==========
> +
> +[1] https://gitlab.freedesktop.org/emersion/drm_info
> +[2] https://patchwork.freedesktop.org/patch/554827/?series=123018&rev=1
> +[3] https://patchwork.freedesktop.org/patch/554826/?series=123018&rev=1
> +[4] https://patchwork.freedesktop.org/series/123018/
