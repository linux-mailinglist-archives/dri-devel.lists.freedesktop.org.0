Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0534B7A61
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 23:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D9610E594;
	Tue, 15 Feb 2022 22:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF1B10E594
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 22:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644963649; x=1676499649;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ybq8qpUOVHRJ7Qw1R+rQV8fBZavTcBTB5YPpb76+fnQ=;
 b=UhTrMZxk5+TjeCsoUqbbYurluKGOrE2j0Tf8mMAm4p3N9/BFIl7KV0jN
 0Nj3e5cbOBORiKzvaMrBJ9fzJFnoqkKoDUg+tswJBjmFmc3Gadla4Fopj
 ecu6CwFtfhWA0dGMteuehdbiDY4UUnTctD68KQiXrZY3+XVBjCdo23XjS
 trJzOrG1YprPkTjvorhd31HwKRPIaVsItkdDifM/jt5fZofk+DCuov3Sw
 XYr3/dcKxKpVtQUd+151jeP0vGEPOhakl0FgxOf+X0WXdJM7te78mCzo0
 VJCgMhoTvVxTJ3d/SrMWF8zSpGSno6JiP9gTzA2udVtULdh2UStaSMNw8 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="248064157"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="248064157"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 14:20:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="587958539"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga008.fm.intel.com with ESMTP; 15 Feb 2022 14:20:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 15 Feb 2022 14:20:48 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 15 Feb 2022 14:20:47 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 15 Feb 2022 14:20:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReuojGUkvzlvkQCflnfrpKB46VW6NVjYZX8JchmwrUrykClcQp8Jf8Ua4gGx5rpBLDx60pc7EF6Z/gWu1JnUQjDTFBnjFzx5R7ZYZ2u0wl5P+AsciPMYcFtns2O6+VHPBzEKoprNlDoDrXJyhDIYo50bWGlClMI3ysMD/7W8NbVOLagJJeqodCnrqVYzLNwQZ7cWV/n3apIlv9e2XfJPqKuSxWrt3cqFdlAY/WTRuyjOit/Eh0p7U4Xmy/0PlCZwulE80kdQoGL8+659FtANI62gjOnSJwT5I1aFFrLvQt75vCbOMIuL8TJm3ext8+LOHeGYCXXhjh83OQPiDcjMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEfRT2+ApZLOvhHnm3wrzR9IaWPhjjr5iHkK+IAoALY=;
 b=LTKvplkt6mCiw6fiLDm2WMGoimw+AcYMIcHO4kyVb21iE4addofgQdq8cMok5CIhvAk8KghgcO1xBj592AWA2vWkxvds10Mye/3mmQqlhlX90mgh1tTwtnYcJE9oXkwQ5rzn2Er5O4cHARiCzItmJhayA6wh6DQ0pqCDxvRKHcIIdJNrGJZgMDZXWKqYJKelb/FATNVODCwIV5DhGJNC94AnYmw+VVLua9/X+r1sd7ihdIXaQ0bA9CoHwi5YKbQByAm6DHaYX31GomcM9GO8ptuIhm1DDEW3PjxtcUl08w7tGoQ9mcuIuBQPXLfILNWqLC4ECPutZbP+Cn8iZKDstQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3169.namprd11.prod.outlook.com (2603:10b6:208:69::32)
 by BN6PR11MB1729.namprd11.prod.outlook.com (2603:10b6:404:101::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 22:20:45 +0000
Received: from BL0PR11MB3169.namprd11.prod.outlook.com
 ([fe80::15bd:829f:569d:8571]) by BL0PR11MB3169.namprd11.prod.outlook.com
 ([fe80::15bd:829f:569d:8571%7]) with mapi id 15.20.4975.018; Tue, 15 Feb 2022
 22:20:45 +0000
Message-ID: <e6670fd7-1f75-56f7-b668-20db9902cac6@intel.com>
Date: Tue, 15 Feb 2022 23:20:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/3] drm: Plumb debugfs_init through to panels
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, Douglas Anderson
 <dianders@chromium.org>, <dri-devel@lists.freedesktop.org>
References: <20220205001342.3155839-1-dianders@chromium.org>
 <20220204161245.v2.2.Ib0bd5346135cbb0b63006b69b61d4c8af6484740@changeid>
 <5d60473d-be8f-e2dc-2ce9-bc0b9056e4b4@redhat.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <5d60473d-be8f-e2dc-2ce9-bc0b9056e4b4@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To BL0PR11MB3169.namprd11.prod.outlook.com
 (2603:10b6:208:69::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b035a092-c3df-441f-cbec-08d9f0d16943
X-MS-TrafficTypeDiagnostic: BN6PR11MB1729:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB1729103692F862D84329F0B7EB349@BN6PR11MB1729.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d9OQOXGkQtOciX15hENqDwrg/qiqkelYbEVo4CWnprkzhexOB1NfbIKNuzIYlhIpcwJN0QOZ8m8iHQgmfFn3Mt+Q7cvHIzn/rz6TiwJOsQltL9RJCMP2X5GYbp6sBsQF8lacS2Wxyu27FOD5Yv5JzVo5OLY0CggaIpBG/yL5fEPz4HPyLihRqoD5QiwzO4KXoVLG/M4zC12mZm0GGXeaRG0QU8TMHLwxZAfZh3cKBJOseZXMiMysFgz3FhlWPaMsFfOAHaWSjq3uLDkMeGaFZEBhtc9n1m1yvNprbVqyGwZPwtwSDCziJfHfqO1BxAr2gVvZy3NXTaX2fgeOQHJrzs23tG3819PCUIKJd7qO/aKte2vcUYMe4lI2CxtUT3BcQ4O91YJ856oVt9I2CBKqXsVSFNe6vTAYa21k1n8pDDW2EztU3+fZZDjmAK333uASvo1wVK8u/ar7Bzq9hzUvHxLRi5IasxvR6tr0EINJMLDwtgKauSHQTYwf96pQnSyjPSTznSoqtVCG81/bgfs6r8x64AIhUGzHYhYnn1qHnDAsrF0VIOL+H/b7hXGaudD5bagIXxlTZ23cjvBs8cGqrRRHpbeNungTRe2ac6/kYEuSN9NnGbldPGmzQwA1+NbDnAO/AiWwwp3oyyZx24+RqZqp3U6URF5G9NyBNlnZq8hrEb2b2982T+SuOi+B5Z/ZkqcYi5X+BweOCWqcmC6CNZNAkl4WhzmDXtJPTOJGpE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3169.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(38100700002)(2906002)(86362001)(31696002)(82960400001)(8936002)(5660300002)(7416002)(110136005)(26005)(8676002)(4326008)(6512007)(6506007)(36916002)(66946007)(54906003)(53546011)(316002)(31686004)(6486002)(83380400001)(66476007)(66556008)(186003)(6666004)(508600001)(2616005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGNvV003MTR4cmFEbjJRbHhUb1VkTlRtaFpEcWh2aTlqTlBqOG5BYUp0YnN4?=
 =?utf-8?B?VEt1cnRxMUxqREF6cWFsM1JZWUVFT0FaQ3F0bXZXUU1DaXA1aXhOaDdiVHBC?=
 =?utf-8?B?MU9PVUQra3U1NUxyTmNHNmM2TDdFaXdGdGh6R0Y0UVB5OGJHaVhnbUJPL2RJ?=
 =?utf-8?B?Yzk1QVJTbUxodm91NFNJR3FHNXE0ZURzZUphQnRyei8vaEZrOUpIQ3RQcGpS?=
 =?utf-8?B?T3RmOU96VEFwMFRZYU1LSzZMZG5aV3lNdld4SEs2aEFTQWFBTDlEeG5RTFdQ?=
 =?utf-8?B?TGEyWjBoV2N2RTM3SXZZaHRFN1pFY01MZ01mLzRlb3g3QUVxMDBhS0lBZXBR?=
 =?utf-8?B?THNkOU8wMzM5c1ZLdldsc1hua2ZjNXBlR2JOWWJZZnJKSTVkYTk3OFF2eFhO?=
 =?utf-8?B?OVhFdC9UL2tLbjJPZnFIUlg5MXdZcDRpNm9PM1RjSEpJQjMvZ01LT0NRYmZp?=
 =?utf-8?B?V2R1WEtKTWI5RW5UcitDOVh6QVA3L0ZGTlZaVUsvc2svclVkUzkvSDk4RHJO?=
 =?utf-8?B?Q1g3R25ZazJYVWwwRVRMQUVZTWg3NjJEdnJFQ3VQM3ZFcUJXQlduUzBTUGtk?=
 =?utf-8?B?c3VJaE9vaElkc0c0ZGZ0b0NTMVNkSm50Sm9NRWFwblFDSXVLSDBLUVVkajRP?=
 =?utf-8?B?U2JaZVFPaTc3SGZPK1JUNTdkbjFHSWs5VUVrWklRN3o2UURYOVdsbzNqOUhl?=
 =?utf-8?B?eWplNlBSRDNEcnhoNjI0M3BYZTNEekxkWGJ1Uk8yajVmdCtrdHcyS25haXpO?=
 =?utf-8?B?YTdNUjdKcU8wekVJdlZtWDh5eFg2R1I1Uk1lVVRSUTdabHRIY2txMnFUZngw?=
 =?utf-8?B?VkplVEJLaUQ3aURsZ2lTTS90SUVUSHBqaElmN2l1SUw0aUJrbzhQQzRZb2NP?=
 =?utf-8?B?ZzdGKzNRTktiQjdXYndHRjM4RHFTQ3dZUjNtY1RKRXM1NGJsRXdENXVhb0Zi?=
 =?utf-8?B?cm1Nd1B0VFFPUG00VmZ5VG9wVzV4RnM2bzJQZk5Rekx1VHZLTFBZdXRRRElv?=
 =?utf-8?B?bm13TktFRDNkVE56VllSYi93cm9CM3RTRGljdW1mczJRSGE2ZTJkdmhlaG1m?=
 =?utf-8?B?dWFWaXRzcVRhcGgrL3NGY1FHY2hLbmk0RWt4cDJ4Z1lIYVp4V3drTmEwVm5s?=
 =?utf-8?B?RUxwK21BdlNXcWQ2Uit6QVZMbnhYYVFqT01JQU9JN2h3QitwSUxhd245cHJD?=
 =?utf-8?B?VFBpeXFtc1hSSWpjMkhIL1FZNlB4YWZ0eFNJMmh4UmIzUFZJbFhPekJvUEJ0?=
 =?utf-8?B?MWxtbisyZTF0WUJPUExNT0JucGNXVkFxMGszVm52SDNibGF4RFVWOG1wZElH?=
 =?utf-8?B?MlZSWllkbVBqVnJhMzM3c1A1RnIweXVBb3RrbDhSZlVuaWc1enZhdjBLOHdm?=
 =?utf-8?B?eENGQmJaWU9rZ3ljN2V0K3picGVkY295SXdsYmxwRktWQ1IyeU5HZ1dwZzZD?=
 =?utf-8?B?VnNEWEJINnd5bVYrdnc3TEVBK2NTOWMvOUhVOU1qUnBWUW11bEx2bWdqYXV3?=
 =?utf-8?B?VG5EVXEvd2NibjJ0ZkxTV2FOZTNLMWpOb0FXejRUanoxWnNiZmRnWmhiUlgz?=
 =?utf-8?B?THVoTjJubEVIc1NKcWd3U2Fxb0hUdWdDSGFSU1QzTE9vcDVGWEdIQUtFTE1F?=
 =?utf-8?B?VDNKM2FpZzh6Z243Vi9yaUhoTlhXZmZxQVh6U3h3MTJCZU9GWHpzUHU0eUxM?=
 =?utf-8?B?bGplSGdtZHl5aWZ5Z0tsVUlnbE0yUVpwaGw5MjFVQTRzZTR1NTRPRWdlTC9w?=
 =?utf-8?B?QWx0aDBjdGlGRG5scGYwVGZGUGhLcGNvOTJwSFFBZ2ZsSmZtOEpRME1UeUtm?=
 =?utf-8?B?bUhQNTlKWWdwOHJyL0Y2eWczRzEvUHNUSkR5dG1kalA3YW5VcTFvNG5BSzEz?=
 =?utf-8?B?eWxMVzRLY0F4d2o5VXNtNVE1TDQ1bTY2eEdKeHJCakhtZFpWZnpvaHN1czA2?=
 =?utf-8?B?NWF1RHlRalBoOS9CN1o0UDFvRTdoZFllZy9vV3A5bzNrSDBLc0ozZ0VabnNm?=
 =?utf-8?B?S1QrQ1Z5RUhaMmNsNmVIMU1hRXpWeThJZ3cxYjAvclB6SzYvVTU5dENheURu?=
 =?utf-8?B?VHY3NWFFdzMxb25zTSs4b2xHLzJxTkZhSWJTenI2VTRSOU9UOENVUW41Mk16?=
 =?utf-8?B?ZmtCeHpnNTlJR2dTUnRlU0Q2OFFRdXcvN3BEWlpzbiszTE5HbnlINjhDbkUr?=
 =?utf-8?Q?RmRsNswnrKwgBuT/jwOBkR4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b035a092-c3df-441f-cbec-08d9f0d16943
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 22:20:45.7017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MF332heN/MPWapJDWShcRmdJOeps4uk4d+5QMd7MZburlIldESyV3wVwEAWPonUHFueGLyS129WriSyA9aUUIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1729
X-OriginatorOrg: intel.com
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 Thierry Reding <thierry.reding@gmail.com>, jjsu@chromium.org,
 lschyi@chromium.org, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15.02.2022 23:09, Javier Martinez Canillas wrote:
> Hello Doug,
>
> On 2/5/22 01:13, Douglas Anderson wrote:
>
> [snip]
>
>> +static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
>> +				      struct dentry *root)
>> +{
>> +	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>> +	struct drm_panel *panel = panel_bridge->panel;
>> +
>> +	root = debugfs_create_dir("panel", root);
> This could return a ERR_PTR(-errno) if the function doesn't succeed.
>
> I noticed that most kernel code doesn't check the return value though...
>
>> +	if (panel->funcs->debugfs_init)
> Probably if (!(IS_ERR(root) && panel->funcs->debugfs_init) ?
>
>> +		panel->funcs->debugfs_init(panel, root);
>> +}
> [snip]
>
>> @@ -436,6 +436,9 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
>>   	/* vrr range */
>>   	debugfs_create_file("vrr_range", S_IRUGO, root, connector,
>>   			    &vrr_range_fops);
> Same here, wonder if the return value should be checked.

I've seen sometimes that file/dir was already created with the same 
name, reporting error in such case will be helpful.

Regards
Andrzej

>
> I leave it to you to decide, but regardless of that the patch looks good to me.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Best regards,

