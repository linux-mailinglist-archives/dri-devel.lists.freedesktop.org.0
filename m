Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DE77CD8E3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 12:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E0E10E09D;
	Wed, 18 Oct 2023 10:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AB710E09D;
 Wed, 18 Oct 2023 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697623801; x=1729159801;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=MIk391YTICwKskRb9aQYU/qCcXnfbhpP9VefB1ycOx0=;
 b=QKV4PezqqaBhJW8IfWaH3RjimELT5HdWGSz+ayep5N6XHnCF0jPoT3y8
 rj1ftwtQJLQwr1BUKBn8oXcZwDu+rC0fl+/pLig2n7IyDnQ0tZVbeyvDZ
 Q3IrL6HPIF7tyIqHqchWbkuOSTsZGlll5dH4a6jH2w9UvlZv0KGKPLTXS
 Jd75foCOE1TAX8UMf3DFIFlVkIOxLXgNS5k55CFO/6kVHvilwHhQrb7Lb
 LzDDmQb/Z1pj8cBTNXtHzh3qclV0ZNFhtyR0nupz/VYYsHX88/+swfzDj
 09opeSoAfPcs2ZKxexUHJjKZFZdKKeU5DxUkry+XFKtroyajBlHbJs/IQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384863653"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="384863653"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 03:09:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="756533694"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="756533694"
Received: from gruberda-mobl1.ger.corp.intel.com ([10.252.62.52])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 03:09:54 -0700
Date: Wed, 18 Oct 2023 13:09:52 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v4 12/17] platform/x86/amd/pmf: dump policy binary data
In-Reply-To: <20231018070241.2041529-13-Shyam-sundar.S-k@amd.com>
Message-ID: <babc47ee-338a-8b4a-83f2-15a093753ac8@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
 <20231018070241.2041529-13-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1969835922-1697623799=:2178"
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1969835922-1697623799=:2178
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 18 Oct 2023, Shyam Sundar S K wrote:

> Sometimes policy binary retrieved from the BIOS maybe incorrect that can
> end up in failing to enable the Smart PC solution feature.
> 
> Use print_hex_dump_debug() to dump the policy binary in hex, so that we
> debug the issues related to the binary even before sending that to TA.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 6c4ce22ba518..2f5fb8623c20 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -276,6 +276,12 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  }
>  
>  #ifdef CONFIG_AMD_PMF_DEBUG
> +static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev)
> +{
> +	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
> +			     dev->policy_sz, false);
> +}
> +
>  static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>  				   size_t length, loff_t *pos)
>  {
> @@ -290,6 +296,7 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>  	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
>  		return -EFAULT;
>  
> +	amd_pmf_hex_dump_pb(dev);
>  	ret = amd_pmf_start_policy_engine(dev);
>  	if (ret)
>  		return -EINVAL;
> @@ -328,6 +335,7 @@ static int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
>  }
>  
>  static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
> +static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev) {}
>  #endif
>  
>  static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
> @@ -342,6 +350,7 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  
>  	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
>  
> +	amd_pmf_hex_dump_pb(dev);
>  	if (pb_side_load)
>  		amd_pmf_open_pb(dev, dev->dbgfs_dir);

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-1969835922-1697623799=:2178--
