Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D083083989C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 19:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA6210E167;
	Tue, 23 Jan 2024 18:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFE310E167
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 18:51:49 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5EBD85C00EA;
 Tue, 23 Jan 2024 13:51:46 -0500 (EST)
Received: from imap53 ([10.202.2.103])
 by compute1.internal (MEProxy); Tue, 23 Jan 2024 13:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1706035906; x=1706122306; bh=eIhN86Lh1o
 FbG7iEsTBql1sUGIAIhzr7pTidTH0KO94=; b=YkxcjYqP7zv1Q1UJo+u25buzs3
 65dwS+kWssYQqDc9bo6V2J5edttkZkg7zohFJum2+8X8XzCEUgEu2LTTx80Or0dF
 rf+HILcVuGSNM2zOg/IZ/Qlf/Gzm828mYhwpTIZFPFhzJZxVfCh+3UZuWjEAw6ol
 d6SD1iHSTwKhMW+BF03rLMDryBsoxvsfWF8lfTkaOGBiMmBLl58pNXzyPTnrJ6YD
 uaOMU9sO9Ler/D9bFhPNDVPtKYVZdb26XYQd+xA0IhN7ZizGcl5r+nlutGddTVab
 9gtCQl4HbXJ2GmQQNjxiDGY9ezHWbGefvKiDnB9rRmqcNYuhiKJr2gQhbqJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1706035906; x=1706122306; bh=eIhN86Lh1oFbG7iEsTBql1sUGIAI
 hzr7pTidTH0KO94=; b=E5nQUiK0Emr6DnF9HINgIoD1V5bl1r+KqEiOLEvgfE59
 HjeEoA6KOy+E4aex9YAhf5PWev0oxqn+k9i/tOgVL+hA6dl9THjVyvDrizITGlBg
 78498S9KYalIBc/5ohOkj9oyx3wZtojEisiRUybtxk2UGRwiHZKiKP+gAREK14ia
 4GOiGBSsmgOXuOjwrq1O5+3B2xlZYNzJ1pJSZlHF2ft2VbBsp7BAUd7ZUmGYIEnu
 6rzE9dlUr9zdbijeBRiSmHOQ4U/9Ai+7eSFanR+pSBmakubdN3/z1gB4TASMYJDT
 w/zMeawbujQMg6slo9HQT0kpe0COnNzcb1de1Qlurg==
X-ME-Sender: <xms:wAqwZX_j8Llq0DrEzoo9SiA9WqQIVH6oXplVNbLzgdBYzwnCDjK_8g>
 <xme:wAqwZTsT_7o1tFNkll9XlpmmrXSyGLirEOks3QV4s_GeA6ZE_FdGv1zlgMbm5rLer
 YSc__8hLNhUGXIPckI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekkedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfl
 rghnnhgvucfirhhunhgruhdfuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtth
 gvrhhnpeejfeekgffhieevhfejgfetkeevvdehteejfedtiedukeefuedvkeehffefvdfh
 ueenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvth
X-ME-Proxy: <xmx:wAqwZVCKpqVkqZkjKkOU6nzeJgIr-wYQv7MUFfGU2zkO0YuL1-XSIA>
 <xmx:wAqwZTcw0E7Dwd0cxZyKHg8Fz9P42Vv3EZWhoYUNOsb8hZaf8ko7eg>
 <xmx:wAqwZcO17foPKjKFckFIU48eX6oKTTYE8UXCMCy5eshrjp7Vxofq2A>
 <xmx:wgqwZTfiD0IzojjKojg1p6O-Wu1S5mK7s7jMNMzO3FsDtXwCUlvp_w>
Feedback-ID: i47b949f6:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BE4A0364006B; Tue, 23 Jan 2024 13:51:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-119-ga8b98d1bd8-fm-20240108.001-ga8b98d1b
MIME-Version: 1.0
Message-Id: <489e3e5d-25e7-4e84-9e62-b6e52bf7455c@app.fastmail.com>
In-Reply-To: <3da403ff-365d-4cea-86f0-4009d1da6baa@app.fastmail.com>
References: <20240117104448.6852-1-arnd@kernel.org>
 <efebd848-c952-41f8-9422-fe2235d92259@app.fastmail.com>
 <3da403ff-365d-4cea-86f0-4009d1da6baa@app.fastmail.com>
Date: Tue, 23 Jan 2024 19:51:23 +0100
From: "Janne Grunau" <j@jannau.net>
To: "Arnd Bergmann" <arnd@arndb.de>, "Arnd Bergmann" <arnd@kernel.org>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [PATCH] drm: apple: mark local functions static
Content-Type: text/plain
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
Cc: Sven Peter <sven@svenpeter.dev>, Asahi Lina <lina@asahilina.net>,
 Hector Martin <marcan@marcan.st>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hej Arnd,

On Tue, Jan 23, 2024, at 08:34, Arnd Bergmann wrote:
> On Mon, Jan 22, 2024, at 21:50, Janne Grunau wrote:
>> On Wed, Jan 17, 2024, at 11:44, Arnd Bergmann wrote:
>>> 
>>> -int parse_sample_rate_bit(struct dcp_parse_ctx *handle, unsigned int 
>>> *ratebit)
>>> +static int parse_sample_rate_bit(struct dcp_parse_ctx *handle, 
>>> unsigned int *ratebit)
>>>  {
>>>  	s64 rate;
>>>  	int ret = parse_int(handle, &rate);
>>> @@ -715,7 +715,7 @@ int parse_sample_rate_bit(struct dcp_parse_ctx 
>>> *handle, unsigned int *ratebit)
>>>  	return 0;
>>>  }
>>> 
>>> -int parse_sample_fmtbit(struct dcp_parse_ctx *handle, u64 *fmtbit)
>>> +static int parse_sample_fmtbit(struct dcp_parse_ctx *handle, u64 *fmtbit)
>>>  {
>>>  	s64 sample_size;
>>>  	int ret = parse_int(handle, &sample_size);
>>
>> thanks, patch included in my dev branch and will be in the next pull 
>> request I'll send to Hector.
>>
>> I suppose the recipients are generated by an automated 
>> get_maintainers.pl invocation. Is that desired for out of tree drivers?
>
> I was wondering about that as well, as I don't usually send
> patches for code that isn't at least in linux-next yet.
>
> I ended up using what is in the MAINTAINERS file for this driver
> in the branch as that is is all I have at this point:
>
> APPLE DRM DISPLAY DRIVER
> M:      Alyssa Rosenzweig <alyssa@rosenzweig.io>
> L:      dri-devel@lists.freedesktop.org
> S:      Maintained
> T:      git git://anongit.freedesktop.org/drm/drm-misc
> F:      drivers/gpu/drm/apple/
>
> I left out the drivers/gpu/ maintainer addresses though.

oops, answered to the wrong patch. The strscpy one has the drivers/gpu/ maintainers and the question. I replied here first assuming it has the same recipient list. I'd consider the recipients for this mail reasonable.

Janne
