Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9336881CD7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 08:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFD110E398;
	Thu, 21 Mar 2024 07:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9pHEDqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E2410E119;
 Thu, 21 Mar 2024 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711005512; x=1742541512;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=Lckff5FoeTT8hV+FQjlzE2maL5NFP8kJNtpVqDxZTCc=;
 b=V9pHEDqD419ZzwA/Ztl09XC24CTpp1FRLP7ovHpieMtxv3wnUguvpxUs
 puDaIUKef8pZzhGs6QhawfqC+HS8hKKvMat6TAHFKM/98SUmVim4txTzw
 ruk5LgIj+mWhMDYyEXMsczFaxAcUCBylA5BSJEjSMdG6EaXGzawagX+qw
 w3mIIxhhizsJUU0nE7LBbhaVE17eOyT3sfSQXmrVKF4fQ+UCm/NsLrcKQ
 dtzGXAQBf6sAAkP2DUHqkZMSz540ZKSkWw5ZDoyLbGL1bwClhnTI1qgiC
 oGw10jFKf9rkYtvsbZy8ex8h6uXExURJ5YxyzmZJIIH4p6xaGeS0CkadE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="23427658"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208,217";a="23427658"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 00:18:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208,217";a="14491977"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 00:18:28 -0700
Content-Type: multipart/alternative;
 boundary="------------TskG7I4mPI7PBVkp14YxX73Z"
Message-ID: <7d41e764-0855-4fa2-b873-4dea8028ee58@linux.intel.com>
Date: Thu, 21 Mar 2024 12:51:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] drm: add devm release action
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
References: <20240320104426.1592959-1-aravind.iddamsetty@linux.intel.com>
 <20240320104426.1592959-2-aravind.iddamsetty@linux.intel.com>
 <ZftMw_911HrrzJTj@intel.com>
 <59514a7a-fbf7-45fa-b205-b4e1ffd019ac@linux.intel.com>
 <87plvom684.fsf@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <87plvom684.fsf@intel.com>
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

This is a multi-part message in MIME format.
--------------TskG7I4mPI7PBVkp14YxX73Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 21/03/24 12:17, Jani Nikula wrote:
> On Thu, 21 Mar 2024, Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com> wrote:
>> On 21/03/24 02:23, Rodrigo Vivi wrote:
>>> On Wed, Mar 20, 2024 at 04:14:25PM +0530, Aravind Iddamsetty wrote:
>>>> In scenarios where drm_dev_put is directly called by driver we want to
>>>> release devm_drm_dev_init_release action associated with struct
>>>> drm_device.
>>>>
>>>> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>>>>
>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>> ---
>>>>  drivers/gpu/drm/drm_drv.c | 6 ++++++
>>>>  include/drm/drm_drv.h     | 4 ++++
>>>>  2 files changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>>> index 243cacb3575c..b23c5081812b 100644
>>>> --- a/drivers/gpu/drm/drm_drv.c
>>>> +++ b/drivers/gpu/drm/drm_drv.c
>>>> @@ -714,6 +714,12 @@ static int devm_drm_dev_init(struct device *parent,
>>>>  					devm_drm_dev_init_release, dev);
>>>>  }
>>>>  
>>>> +void __devm_drm_dev_release_action(struct drm_device *dev)
>>>> +{
>>>> +	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
>>>> +}
>>>> +EXPORT_SYMBOL(__devm_drm_dev_release_action);
>>>> +
>>>>  void *__devm_drm_dev_alloc(struct device *parent,
>>>>  			   const struct drm_driver *driver,
>>>>  			   size_t size, size_t offset)
>>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>>> index 8878260d7529..a1d12cb72088 100644
>>>> --- a/include/drm/drm_drv.h
>>>> +++ b/include/drm/drm_drv.h
>>>> @@ -444,6 +444,8 @@ struct drm_driver {
>>>>  	const struct file_operations *fops;
>>>>  };
>>>>  
>>>> +void __devm_drm_dev_release_action(struct drm_device *dev);
>>>> +
>>>>  void *__devm_drm_dev_alloc(struct device *parent,
>>>>  			   const struct drm_driver *driver,
>>>>  			   size_t size, size_t offset);
>>>> @@ -477,6 +479,8 @@ void *__devm_drm_dev_alloc(struct device *parent,
>>>>  #define devm_drm_dev_alloc(parent, driver, type, member) \
>>>>  	((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
>>>>  				       offsetof(type, member)))
>>>> +#define devm_drm_release_action(drm_dev) \
>>>> +	__devm_drm_dev_release_action(drm_dev)
>>> why not simply renaming the original function?
>> didn't get you which function are you referring to?
> Why add a function with double-underscores, and then wrap it in a macro
> without the underscores?
>
> devm_drm_dev_alloc() is that way only because it needs sizeof and
> offsetof on the arguments, not to set a general example.

Oh ok got it Rodrigo was referring to _devm_drm_dev_release_action.

right, I took the reference of devm_drm_dev_alloc, thanks for the explanation
will change it.
Regards,
Aravind.
>
> BR,
> Jani.
>
>> Thanks,
>> Aravind.
>>>>  
>>>>  struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
>>>>  				 struct device *parent);
>>>> -- 
>>>> 2.25.1
>>>>
--------------TskG7I4mPI7PBVkp14YxX73Z
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix"><font face="monospace">On 21/03/24
        12:17, Jani Nikula wrote:</font><br>
    </div>
    <blockquote type="cite" cite="mid:87plvom684.fsf@intel.com">
      <pre class="moz-quote-pre" wrap="">On Thu, 21 Mar 2024, Aravind Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@linux.intel.com">&lt;aravind.iddamsetty@linux.intel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 21/03/24 02:23, Rodrigo Vivi wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Wed, Mar 20, 2024 at 04:14:25PM +0530, Aravind Iddamsetty wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">In scenarios where drm_dev_put is directly called by driver we want to
release devm_drm_dev_init_release action associated with struct
drm_device.

Cc: Thomas Hellstr_m <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>

Signed-off-by: Aravind Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@linux.intel.com">&lt;aravind.iddamsetty@linux.intel.com&gt;</a>
---
 drivers/gpu/drm/drm_drv.c | 6 ++++++
 include/drm/drm_drv.h     | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 243cacb3575c..b23c5081812b 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -714,6 +714,12 @@ static int devm_drm_dev_init(struct device *parent,
 					devm_drm_dev_init_release, dev);
 }
 
+void __devm_drm_dev_release_action(struct drm_device *dev)
+{
+	devm_release_action(dev-&gt;dev, devm_drm_dev_init_release, dev);
+}
+EXPORT_SYMBOL(__devm_drm_dev_release_action);
+
 void *__devm_drm_dev_alloc(struct device *parent,
 			   const struct drm_driver *driver,
 			   size_t size, size_t offset)
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 8878260d7529..a1d12cb72088 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -444,6 +444,8 @@ struct drm_driver {
 	const struct file_operations *fops;
 };
 
+void __devm_drm_dev_release_action(struct drm_device *dev);
+
 void *__devm_drm_dev_alloc(struct device *parent,
 			   const struct drm_driver *driver,
 			   size_t size, size_t offset);
@@ -477,6 +479,8 @@ void *__devm_drm_dev_alloc(struct device *parent,
 #define devm_drm_dev_alloc(parent, driver, type, member) \
 	((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
 				       offsetof(type, member)))
+#define devm_drm_release_action(drm_dev) \
+	__devm_drm_dev_release_action(drm_dev)
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">why not simply renaming the original function?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
didn't get you which function are you referring to?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why add a function with double-underscores, and then wrap it in a macro
without the underscores?

devm_drm_dev_alloc() is that way only because it needs sizeof and
offsetof on the arguments, not to set a general example.</pre>
    </blockquote>
    <p><font face="monospace">Oh ok got it Rodrigo was referring to <span
        style="white-space: pre-wrap">_devm_drm_dev_release_action.</span></font></p>
    <font face="monospace"><span style="white-space: pre-wrap">right, I took the reference of devm_drm_dev_alloc, thanks for the explanation</span></font><br>
    <font face="monospace"><span style="white-space: pre-wrap">will change it.
</span></font><br>
    <font face="monospace"><span style="white-space: pre-wrap">Regards,</span></font><br>
    <font face="monospace"><span style="white-space: pre-wrap">Aravind.
</span></font>
    <blockquote type="cite" cite="mid:87plvom684.fsf@intel.com">
      <pre class="moz-quote-pre" wrap="">

BR,
Jani.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Thanks,
Aravind.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap=""> 
 struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
 				 struct device *parent);
-- 
2.25.1

</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------TskG7I4mPI7PBVkp14YxX73Z--
